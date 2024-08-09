import { router } from '@kit.ArkUI'

@Component
export struct HdNav {
  @StorageProp('topHeight')
  topHeight: number = 0
  @Prop
  title: string|Resource = ''
  @Prop
  hasBorder: boolean = false

  @Prop leftIcon: ResourceStr = $r('app.media.icon_title_back')
  @Prop rightIcon: ResourceStr = $r('sys.media.ohos_ic_public_more')

  @BuilderParam titleBuilder: () => void

  @BuilderParam rightBuilder: () => void

  @Builder
  defaultMenu() {

  }

  build() {
    Row() {
      Image(this.leftIcon)
        .size({ width: 34, height: 36 })
        .onClick(() => router.back())
        .padding({
          left:15,right:10,bottom:10,top:10
        })
      Row() {
        if (this.title) {
          Text(this.title)
            .fontWeight(600)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .fontSize(18)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        } else if (this.titleBuilder) {
          this.titleBuilder()
        }
      }
      .height(56)
      .layoutWeight(1)

      if (this.rightBuilder) {
        Stack(){
          this.rightBuilder()
        }.padding(15)
      } else {
        Blank().width(24)
      }
    }
    .height(56 + this.topHeight)
    .width('100%')
    .border({
      width: { bottom: this.hasBorder ? $r('app.float.common_border_width') : 0 },
      color: $r('app.color.common_gray_bg')
    }).backgroundColor($r('app.color.white'))
  }
}