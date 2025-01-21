# Objective-C KVO Memory Management Bug

This repository demonstrates a common but subtle bug in Objective-C related to Key-Value Observing (KVO) and memory management. The bug occurs when an observer is deallocated before its observation is removed from the observed object, potentially leading to crashes or unexpected behavior.

The `bug.m` file contains the buggy code, while `bugSolution.m` provides a corrected version that addresses the memory management issue by properly removing the observer before deallocation.

## Bug Description

The core issue stems from the lack of proper cleanup in the observer's `dealloc` method. When the observer is deallocated, it's still registered as an observer of the observed object.  Accessing this deallocated observer can lead to a crash.

## Solution

The solution involves removing the observation within the observer's `dealloc` method or in the observed object when it's no longer needed using `removeObserver:forKeyPath:`.