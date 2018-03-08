//
//  JLFramework.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#ifndef JLFramework_h
#define JLFramework_h

#ifdef DEBUG
#define JDLog(...) NSLog(@"\n{类名}:%s,\n{行数}:%d\n{NSLog}:%@ \n\n", __func__, __LINE__, [NSString stringWithFormat: __VA_ARGS__])
#else
#   define JDLog(...) /* */
#endif

#define JDLogFunc JLDebugLog(@"%s",__func__)
#define JDLogFuncStr(str) JDLog(@"%s,%@",__func__,str)

#endif /* JLFramework_h */
