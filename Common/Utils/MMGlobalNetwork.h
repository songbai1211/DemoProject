

#import <Foundation/Foundation.h>



/**
 * Increment the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void TTNetworkRequestStarted();


/**
 * Decrement the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void TTNetworkRequestStopped();


