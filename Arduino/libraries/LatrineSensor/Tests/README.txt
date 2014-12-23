The files in this folder are unit testing for the Latrine Sensor library.

Running these tests requires installation and setup that is especially complicated on Windows systems.
These tests are not required to use the library normally.
If you don't need to verify the operation of the library, you do not need to worry about these tests at all.

Also, the tests are incomplete and do not provide any kind of documentation or requirements for the library.
They have been written as very basic functionality tests only and should be treated as such.
Do not assume that passing tests are indicative that the library will work in all cases.

To run the tests:

    Install the Unity test suite (http://throwtheswitch.org/white-papers/unity-intro.html).
    Install 'make'.
    Create an environment variable UNITY_FOLDER that contains the unity folder.
    Open a terminal in the test folder and run 'make'.
