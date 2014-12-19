/*
 * Includes
 */

#ifdef UNITY_TEST
#include <iostream>
#endif
 
#include <LatrineSensor.h>

#ifndef UNITY_TEST
#include <util/atomic.h>
#endif

#ifndef min
#define min(a, b) (((a) < (b)) ? (a) : (b))
#endif


/*
 * Constants (might become private class variables?)
 */

static const unsigned long UPDATE_TICK_MS = 1000;

LatrineSensor::LatrineSensor(LS_START_CB pFnStart, LS_END_CB pFnEnd, bool bEmitDebugInfo)
{
	m_pFnStart = pFnStart;
	m_pFnEnd = pFnEnd;
	m_bEmitDebugInfo = bEmitDebugInfo;
	
	m_averageHigh = 0;
	m_minimumLow = 0;

    m_sensitivity = 200; // Default sensitivity is 200
    
	m_flushStartThreshold = 0;
	m_flushEndThreshold = 0;

	m_calibCount = 0;
	
	m_LastUpdate = 0;
	m_flushDurationMs = 0;
	
	m_flushState = STATE_CALIBRATING;

}

void LatrineSensor::Setup(void)
{
	#ifndef UNITY_TEST
	/* Timer1 (16-bit timer) setup) 
	- Counts on T1 pin, which is PD5 which is Arduino pin 5 */
	TCCR1A = 0; // Output compare off, waveform generation off
	TCCR1B = 0x06; // Input capture off, waveform generation off, clock source external falling edge
	TCNT1 = 0;
	#endif
}

#ifndef UNITY_TEST
uint16_t LatrineSensor::Update(void){ return updateTask(); }
#else
uint16_t LatrineSensor::Update(uint16_t count) { return updateTask(count); }
#endif

bool LatrineSensor::IsCalibrating(void) { return m_flushState == STATE_CALIBRATING; }
bool LatrineSensor::IsFlushing(void) { return m_flushState == STATE_FLUSHING; }
	
void LatrineSensor::emitDebugInfo(uint16_t lastCount)
{
	#ifndef UNITY_TEST
	Serial.print("A=");
	Serial.print(m_averageHigh);
	Serial.print(", C=");
	Serial.print(lastCount);
	Serial.print(", FS=");
	Serial.print(m_flushStartThreshold);
	Serial.print(", FE=");
	Serial.print(m_flushEndThreshold);
	Serial.print(", S=");
	Serial.println(m_flushState);
	#else
	std::cout << "A=" << m_averageHigh << ", C=" << lastCount << ", FS=" << m_flushStartThreshold << ", FE=" << m_flushEndThreshold << ", S=" << m_flushState << std::endl;
    #endif
}

#ifndef UNITY_TEST
uint16_t LatrineSensor::updateTask(void)
#else
uint16_t LatrineSensor::updateTask(uint16_t count)
#endif
{
	#ifndef UNITY_TEST
	volatile uint16_t count;
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE)
	{
		count = TCNT1;
		TCNT1 = 0;
	}
	#endif
	
	switch(m_flushState)
	{
	case STATE_CALIBRATING:
		updateCalibration(count);
		break;
	case STATE_IDLE:
		handleIdleFlush(count);
		break;
	case STATE_FLUSHING:
		handleFlushing(count);
		break;
	}
	
	if (m_bEmitDebugInfo) { emitDebugInfo(count); }
	
	return count;
}

uint16_t LatrineSensor::GetFlushStartThreshold(void)
{
	return m_flushStartThreshold;
}

uint16_t LatrineSensor::GetFlushEndThreshold(void)
{
	return m_flushEndThreshold;
}

void LatrineSensor::SetSensitivity(uint16_t newSensitivity)
{
    m_sensitivity = newSensitivity;
}

void LatrineSensor::updateCalibration(uint16_t lastCount)
{
	static uint32_t calibCount = 0;

	m_calibCount += lastCount;

	if (++calibCount == 5)
	{
		m_averageHigh = (m_calibCount / 5);
		updateStartThreshold(m_averageHigh);
		m_flushState = STATE_IDLE;
	}
}

void LatrineSensor::updateStartThreshold(uint16_t lastCount)
{
	m_averageHigh = (m_averageHigh + lastCount) / 2;
	m_flushStartThreshold = m_averageHigh - m_sensitivity;
}

void LatrineSensor::updateEndThreshold(uint16_t lastCount)
{
	m_minimumLow = min(lastCount, m_minimumLow);
	m_flushEndThreshold = m_minimumLow + m_sensitivity;
}

void LatrineSensor::handleIdleFlush(uint16_t count)
{
	if (count < m_flushStartThreshold)
	{
		m_minimumLow = count;
		m_flushState = STATE_FLUSHING;
		resetFlushDuration();
		if (m_pFnStart) { m_pFnStart(); }
	}
	else
	{
		updateStartThreshold(count);    
	}
}

void LatrineSensor::handleFlushing(uint16_t count)
{
	updateEndThreshold(count);
	updateFlushDuration();
	if (count > m_flushEndThreshold)
	{
		if (m_pFnEnd) { m_pFnEnd( getFlushDurationInSeconds() ); }
        // Update the flush start threshold to be (this flush end threshold- minimum diff)
        m_flushStartThreshold = m_flushEndThreshold - m_sensitivity;
        m_averageHigh = m_flushStartThreshold;
		m_flushState = STATE_IDLE;
	}
}

void LatrineSensor::resetFlushDuration(void)
{
	m_flushDurationMs = 0UL;
}

void LatrineSensor::updateFlushDuration(void)
{
	m_flushDurationMs += UPDATE_TICK_MS;
}

uint16_t LatrineSensor::getFlushDurationInSeconds(void)
{
	return (m_flushDurationMs + 500) / 1000;
}

