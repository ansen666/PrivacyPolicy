import { preferences } from '@kit.ArkData'
import PrivacyPolicyDialog from '../dialog/PrivacyPolicyDialog'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct Index {
    @State isAgreePrivacyPolicy:boolean=false;

    build() {
        RelativeContainer(){
            Row({space:10}){
                Image($r('app.media.app_icon')).width(60).height(60)

                Column({space:5}){
                    Text($r('app.string.app_name')).fontSize(22).fontColor($r('app.color.title_color'))
                    Text($r('app.string.launcher_tip')).fontSize(14).fontColor($r('app.color.other_color'))
                }.alignItems(HorizontalAlign.Start)
            }.alignRules({
                bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
                middle: { anchor: '__container__', align: HorizontalAlign.Center }  //以父容器为锚点，水平方向居中对齐
            }).margin({
                bottom:30
            })

            if(!this.isAgreePrivacyPolicy){
                PrivacyPolicyDialog({
                    cancel:this.onCancel.bind(this),
                    confirm:this.onAgree.bind(this),
                })
            }
        }.width('100%')
        .height('100%').backgroundColor($r('app.color.white'))
    }

    onCancel():void {
        (getContext(this) as common.UIAbilityContext)?.terminateSelf()
    }

    onAgree():void {//同意隐私政策
        this.isAgreePrivacyPolicy = true;
    }
}