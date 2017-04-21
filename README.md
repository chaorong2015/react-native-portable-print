# react-native-shared-images
＃ iOS 分享链接 多张图片
#### iOS
1. `npm install react-native-portable-print --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-portable-print` and add `RNPortablePrint.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `RNPortablePrint.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Click `RNPortablePrint.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). In the `Search Paths` section, look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../../../node_modules/react-native/React` - mark both as `recursive`.
5. Run your project (`Cmd+R`)

```js

####使用说明

##1、先引用库
import { PortablePrint } from 'react-native-portable-print';

##2、接口说明
/*测试插件*
＊@para msg string
*/
await PortablePrint.testPrint(msg);
