
#import <UIKit/UIKit.h>
#import <pthread.h>

static int              gNetworkTaskCount = 0;
static pthread_mutex_t  gMutex = PTHREAD_MUTEX_INITIALIZER;


///////////////////////////////////////////////////////////////////////////////////////////////////
void MMNetworkRequestStarted() {
  pthread_mutex_lock(&gMutex);

  if (0 == gNetworkTaskCount) {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
  }
  gNetworkTaskCount++;

  pthread_mutex_unlock(&gMutex);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void MMNetworkRequestStopped() {
  pthread_mutex_lock(&gMutex);

  --gNetworkTaskCount;

  gNetworkTaskCount = MAX(0, gNetworkTaskCount);

  if (gNetworkTaskCount == 0) {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  }

  pthread_mutex_unlock(&gMutex);
}
