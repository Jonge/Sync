#if SWIFT_PACKAGE
// Makes the Objective-C API (for example the `NSEntityDescription` primary key helpers)
// available to clients that `import Sync`, the same as the CocoaPods framework module.
@_exported import SyncObjC
#endif
