#ifndef _LATRINE_SENSOR_H_
#define _LATRINE_SENSOR_H_

#include <stdint.h>

typedef void(*LS_START_CB)(void);
typedef void(*LS_END_CB)(uint16_t durationInSeconds);

class LatrineSensor
{
public:
	LatrineSensor(LS_START_CB pFnStart, LS_END_CB pFnEnd, bool bEmitDebugInfo = false);
	#ifndef UNITY_TEST
	uint32_t Update(void);
	#else
	uint32_t Update(uint32_t count);
	#endif
	void Setup(void);
	bool IsCalibrating(void);
	bool IsFlushing(void);
	
	uint32_t GetFlushStartThreshold(void);
	uint32_t GetFlushEndThreshold(void);
    
    void SetSensitivity(uint16_t newSensitivity);
private:

	enum application_states
	{
		STATE_CALIBRATING,
		STATE_IDLE,
		STATE_FLUSHING,
	};
	
	LS_START_CB m_pFnStart;
	LS_END_CB m_pFnEnd;
	
	bool m_bEmitDebugInfo;

	uint32_t m_averageHigh;
	uint32_t m_minimumLow;

	uint32_t m_flushStartThreshold;
	uint32_t m_flushEndThreshold;

    uint16_t m_sensitivity;
    
	long m_calibCount;
	
	uint32_t m_LastUpdate;
	uint32_t m_flushDurationMs;
	
	uint16_t m_flushState;

	#ifndef UNITY_TEST
	uint32_t updateTask(void);
	#else
	uint32_t updateTask(uint32_t count);
	#endif
	
	void updateCalibration(uint32_t lastCount);
	void updateStartThreshold(uint32_t lastCount);
	void updateEndThreshold(uint32_t lastCount);
	void handleIdleFlush(uint32_t count);
	void handleFlushing(uint32_t count);
	
	void resetFlushDuration(void);
	void updateFlushDuration(void);
	uint16_t getFlushDurationInSeconds(void);
	void emitDebugInfo(uint32_t lastCount);
};

#endif
