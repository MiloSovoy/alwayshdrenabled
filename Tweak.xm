%hook PLCameraController
-(bool) isHDREnabled {
	return TRUE;
}
-(bool) hasFlash {
	return FALSE;
}
%end