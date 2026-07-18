<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY AutoLotForm "S1LotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">

  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">

  <!ENTITY TransferID "S1Tran">
  <!ENTITY Controller "S1WIP">
  <!ENTITY Code "SF1">
]>

<grid table="ds1$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs1$000000" prime="ds1$" inquiry="is1$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Bán thành phẩm" e="WIP"></header>
      <items style="AutoComplete" controller="SFCWIP" reference="ten_vt%l" key="ma_lsx = '{[$ma_lsx]}' and ma_cd = '{[$ma_cd]}'" check="ma_lsx = '{[$ma_lsx]}' and ma_cd = '{[$ma_cd]}'" information="ma_vt$vsfctdmwo.ten_vt%l"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILiU4/j+cmvwbX7aFrs5SgWqaftFWGsSjgpxOktg3dwf/</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên bán thành phẩm" e="WIP Description"></header>
    </field>

    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtRpUyjZvArDq5qaE9eL1UxUEp0MrMMXXbY6inLuRYm3e</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nc" allowNulls="true" width="100" clientDefault="Default" aliasName="a">
      <header v="Nhân công" e="Labor"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1' and (ma_px = '{[$ma_px]}' or ma_px = '')" check="ma_px = '{[$ma_px]}' or ma_px = ''" information="ma_nc$sfdmnc.ten_nc%l" row="1"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" clientDefault="Default" inactivate="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên nhân công" e="Labor Name"></header>
    </field>

    <field name="nh_nc" allowNulls="true" width="100" clientDefault="Default" aliasName="a">
      <header v="Nhóm nhân công" e="Labor Group"></header>
      <items style="AutoComplete" controller="SFCEmployeeGroupList" reference="ten_nh_nc%l" key="status = '1' and (ma_px = '{[$ma_px]}' or ma_px = '')" check="ma_px = '{[$ma_px]}' or ma_px = ''" information="ma_nh$sfdmnhomnc.ten_nh%l" row="1"/>
    </field>

    <field name="ten_nh_nc%l" readOnly="true" external="true" clientDefault="Default" inactivate="true" defaultValue="''" width="300" aliasName="d.ten_nh%l">
      <header v="Tên nhóm nhân công" e="Labor Group Name"></header>
    </field>

    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ma_tc1" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc2" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc3" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_loai1" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai2" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai3" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="ten_dvt%l"/>
      <field name="dvt"/>

      <field name="he_so"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>

      <field name="ma_nc"/>
      <field name="ten_nc%l"/>
      <field name="nh_nc"/>
      <field name="ten_nh_nc%l"/>
      <field name="ghi_chu"/>

      <field name="ma_tc1"/>
      <field name="ma_tc2"/>
      <field name="ma_tc3"/>

      <field name="ma_loai1"/>
      <field name="ma_loai2"/>
      <field name="ma_loai3"/>

      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="nhieu_dvt"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iQiDma95rJEgDZwaYjvIOYF3BBM94WTKsOjq0OTmvMpi7BDl8Kxr8EZol/PjFltDRWKj2RZhNXga+MvI/QAg1N+wUk2VFWUuOM/3ujhCMoNDrBpnXq28AC5p5M1UauacUdgdSkcK8HfWxIvXRF03P6wq3W4K4MIwspFx4yHsYVJGodmoiXAvVBYcawByYjFFD/QVvQkcLgji8h7Qt5VdAqmj/BmvEonYk3oma6LNfKPcRx3FHklak6QXihx9Am/q3Ejq8lBl5iTXVoGC4OtsCskXLG03bwD/MonxlSBDRskXtQkqDF452ie+jg8h9ayLkefdJTye8OiCGT6svJOLTImhBuv7Rn7uQqJz75DDGGwr1IucaryUSWz5DfLFeCZjIrzFE3mEeqSHDaLj0oID5AA==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8q+aAfaKX9gCfQOs4ezbHCT6QVLfAYlqPn6pUCfPrioQa0QgtCc+3sM/s6qawdTAA==</Encrypted>]]>&Code;<![CDATA[<Encrypted>&kF5JEuwtJfmtB14kre5wRS+MNfbADsH6mKCzZP68N7usVaXzuVYWj3EIoEAq5fz6Cs7ExDEaNnLGTpuI3s0YUjMGEX4CGgAFuzfEpv6dBo+0GQrqs33fgTaeBK0AQ/vzJ1WNaWPwPfQFw0/CvM3ojqGlrh8j0TQF1J+eMF3ckfI=</Encrypted>]]>&Code;<![CDATA[<Encrypted>&U5M9a2ZkLHTRJtDrNNZOF/k4EnPX01wJNRwj7TzkAnBYAoKbiCEp2lnhjJGiusloT3MIcPl9kyk+PnJMt3fgis/LEAOPQHaCeKfgc7WUsjYnXbCNg/EaOL6mfPDl7KSzfPRZOfrAZDXdnXS4fYN7TeheJvFWwl94V4x+eK+dvTc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVhW9Ye2P9vN6XVGbzXjdRMpgtQkSCcygI0pfMbNNFx9g==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5HvzbxBgumpis5MOcCHCpbCHUxyVuwPcSDjoCj4XoB1A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1/Mogy0FPm8uUth20lwZPWYBwzPJ9Ex4kNqg9BAJEtfisAfN1RZE7Ea/ze2BG2W0CUupMWWsTymWOkEc7MAIKQw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RuC2hHhpjJ2+WhmLZlVVaPW7vhWRknwsiyvnfI61dIIIzevLv128PGkRC92kr6N6RzjMjok4QrH00d25f9xwFNg=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS970XdZtmsUi61yoyHV3Lv1T+htwBXp1htSCDlkMJVweM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdtWiVCeyOuptv15r4tpNtCzAOYATfoTup/9Qwn6tyhrN83vZvOy1drnoCS2z0oSrH8i6G4Z6BgNinmCpfD65arnKD7waTRbmhvNmEfazBbSkW1EDcFoJQIDw/8nas+viVll0bBN0EYAfKrDQkEBskcurGgT4E4rNWeeT8rd7DBTP6gQtbRnXMit1hkxPVfE2vY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+3cjzkMHK2RjfNJH5Zu70dl1WjkXDX9JwP53S3UEmP+95ICJRFgjzuB+h1lxS8osPBQ6bx+9IBgBK4yxtS1N0hvdkfUQgZWTZ2xFdpdpn6Y</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATaXi+hfMFn8i8+B2+OaNDpJmNVKS/UFmTWgCCDO20xz7w==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvcJbZJZuPqPO838rut1VWC6dJIjjzmVr65eU9VHir6/MbYhYOO6nXgZa+/NC8ZDh0LirCAioDCALNt0qWplGQuQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RpFum38JGD6+/2ip4K4YeIsczcrBjzVFVDjcIlS+YjbW//aydQhKRPn5NGs/fVJeTHbsb9gKQYH/ILjL08Ee29g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILlMmXnpFUjBRC1KrBOCe9zYv4VaUena06Bbtn1OOpw+YACnk6mLfsCcPbxDvVD221bQYsqFauDVXyhTrq15VBU1ct1s5pTQxiYC4qiIiXbUelTM7YVsfU/Pm0XvEIur9mA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtccrK29Q9xO6AAlFSeYI/LPTtzYbCm3i19UrlzxexhHtgHrS3jJSqgbN1KFWv3b3a6FYQNXFwfKh1ToqT1C+ELZAuQQYIXtC971AZOygYUn1MfWiQ6eE7PsTTu29peAntA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12EsMpyvYJtfA70TGj7FSEzdyIZ2XynZHLoqclMaURxJ1e1UzNOHeirZDNb+JBzZwEoFOTVecckgWaqwk0pVdoCYodIVzJhWLEiAfrRxgJXLgUH01lPZqtX/DcWYAOxjxHoDpSyciclLEqg8BYwNqpGOD0oWxT5BWroLpmJvb5/KefqrFEoMRSJopbfYaz0RggMZ4YWLnKpnzRQZkimrVIjR9+zBUNRgQ28VX6WyLudwxLYa7Ba9IsiuwAjdGaF3QPGqEhlrv8M+i5oBte98llk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kzM1MFg7rupLYJM0kTa3w5YBVtQWr+ago6kkBPRW8TwSa3LI1ieIU2PUw1Wqpw8T391zLeLRHCXF0zOEhGj5m6Qn6nTy6aCZygmD/dqvIiyP7uyRHL9T+kg1Y3IRcOY7Ag==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN384dHIe3cLnLp0EwR+SEYP3QjJCUye4clMqX8TBNiX9C8k+dDHax3AubF6xD3ji9ZZl5FejLwcoU/HUxKQhdIrXolzojnPKhM1DmhyrHa53Cgl6H49KSgXOy01KTbriojc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN3+YXi8h+VOOMpnWC6LXZYaSsK9iwV6xBiqnwRFbkVmkSGaIFbMgXXO8fCnlL41a13c+G7mOau/yHIE/EMVQI1YyygMycf2UzdkMAYGn6fjvanNZoVd+OAj1h/KFYpGNIZtzUxRQJ27zBH1eMZhena9G0sl8UQ4YKWPFGV9mPt2totmrYDlSeBL+mNxX6iyD03l81fxYevg+qK7G8Yk/dca86cdusvGRdplmK7W3fzlpvWhtSqDTJcBjFYAQesJc/IWFVdqdAkl9QgMiR5LeifFhd68IgBxISedV3KpzkKNe1kl9Pkgwi58IAm6YkbOucTEcu7vWkEEVvYBq9krSetUtn865xgth+LUajiUidj/HhLuaVFZA31zmnVZYgM0ZcuFLCFT6sO/OAx05S/x2a7zHXFshhw3DDnEmWBoeKl3bQbgZx+YNHf0rw7OjYWRQo7p0UeQmMHEUdKv3FyFQNqNRbhUR8ZyuvD70QyqG7ogfEUQRfnMeyqchJEOqn2A26SNhxWb7Ii2pyvIVZShugGNfQ1zSlsYWxqKrAv74Ki9Q02VKig+Pu6LDuZ8AblL14nRZ67eXXzhpIGbdjSK0DiJmnNIXieX4RKLiRJiRUBkP3/isDtZTunSCZgSdLiRJIUEQkrp46tYBlbwtcvgxfm9cR5RNqa3dLXDgRZptUOVdkjfsXGgKMKy7SEGJgAkeyWMCkx7DWXp6ZuAih/RzpiCHCURCXIyMoxlSSY94fsoPqyz0/xf3fF3Hzc/QYc8DLHS5iu2uIL/vY1tSdsqkqv5xoSiGPcQaBI7TTCBtKDkxn2mSSdCtBLwJ479a+wEfPad9eM0WoncU3FJu9SV76pL7wkNVD/wLNzxadptuT4IP1A1KdNuTo/i/Bm+0J49AZr4NNwn9BDb5ojdgAeiq0kKojbrIfvxmXEpSLfvuhjXFMC43+7Yr0tjTkY73pHGt5qMrBWiG9yvKEF4pV9CwHNG8eoILZfIg57ZjK37lSIQcc4N4zx6jRUOQQEvKO0v7JItxhfe1L9r6YgMCnwSZaPs189L0pMx9e8C2ZHYDwKvBo9WPybJz0ZBsYbkuUQNrTII8QbMGskHK9I6cz7hWefbOugV6fX/FYTTZO/XHlgaSdz4pKd0GRyrUP3MaeZnIJ7+UUwv7bxBj/GgsrP8rAyCqw3Y7QK9XpIrp1Lna3G2ELvN8TWyieFj9Bvn+giaSjpUpGkD/KAL8zKUi8Z2C7RZ2FwHk8pp7erTNzBPQ0N1wjRN+UTG6cyzh3zl43W7AmTMq9AvcD+tEzQ5DfUjoEt5t/pyEq4el9SRuj8ZEo8xFNj5FrHBsFqDy6jAVikVG/+JWkFlxWrVYpp5NGoPJN/6QXBTNQ+CYkSMMgdKBcP3MPxz5c0eWpIC8aJSXWvxaYuDOASP45Y1jgJhEies/pQUjZfjRznaV34K5A22B1qwe4UPQzD5vzOXExSrWlt3np8Jfw7Fdxek6pLLaqlxYlPB5LWReBipHnTYpHIMpA8oGVkMnSnsxrwKFg8yYf5f2HnQaFPwWnaCICs4DTRsEZnZu</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCpVGFcSOqD5S3C8v1UGCRcdTT1FrZQoJEB3nEz49rd18Pkmol8MqKkCxFdd3FVz8PPgQZJg2K5N13IkWXmOo6Duc7QLDxxL90ybq+hkSAK3eUka/LsdEjgME1/1RQUhD9VC22shnC79MmDnNUSbMYxdu4hG8n2mNf5ap9GghvkrdC22xfAP1bLkejAcJF59hFMeXwvRwG0uHOgA1gF3pZtpWtVWQlY695xyPgcTPuXkAZqEzxUB5BgwUp6qsy3AP23huBhgekMcrWiRqALsqrfr/EJWw2nl9cyYwgMJGRZj+KCz6Kfsu1agxKhms5xJp2wp6apBSFmUBhb17ixouI9mozw+Wn5fXHvu+ntyaXG9aaoHpJeTXXBy12W3vqH4d28YeQhqeoq/qR2yYFwTIjgidjsX3yNYRpu2711IYZIJij9FJHYfcG4qkOtCJgY/nAG5LD/Q1CnFKGkA0YjF7WAOHDynmFSaejKa/MbODVYOg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xjJ1xxafPCTyZGUuk/VfpJIc1VFbRyERp/VJE1kxcH2yuXVjI8nlCHmDXC06Rnnnnii+YiooPs0NyQe/vBLzlFmmeFyxwem/3lRhFuecJ3v</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYYYHZA0lH+CJLEFjOz1iv38dIrpvTIF0QuPGKG2v5rDBiqbUllZ1nhB9A9mFkL+gSPBPQmB8VimheozY3nkNuTFmf8Kv9bQt1IUAajlhgL4+8QdBg7WltUIQFcrhf17vdUG2jK6K4Vx4hWrUkShVlqxA6fI3onqGDmt/52JI+7OYhE1a8YEdlKtDkS90SRvciPlebSvTwioGLyy46tM3m+uouWp9iBrwOXGcLnGJu+NXpoMTWJP2o6RllijqngPm6MnN7QPg/O7NmFsqCKUdXjiLB1oH70NY0KqUsPN05odfjZhjmNc40Im0eRIhisc7cna9dDTC5XHxftOzu0PjxdaWMC3xhlbWfI7PiCj2tjYso7kFARbH76t2+ttauCklHIQUJO1o4sp4DdMwcPyj7d1k9HDV5UvojjhBka/CanfAHuZLSCy8xXOqjC7eDYclcjbszZn7dLut4inlcthV19oEcydjWgheWFa6ihMkFsau1H9fkP1DKTELN3iTFAOFbHWlsy3prXEBJNIaj3ueAo8TlwOrueO7ZtH55WUIOOsVEQ8pG7//r5/Sa7/ApmV6qCakxeqsIozjUnor9r+49edQl8c68pVF/1rbDFMWwLrIxgUBkE/lVVJrcBIQ+bVt3uX0+L/+ge3CcTosFiLU7073UtwZR41h9Gm20Y/K8NNfmtfzY/y5sy2r44Fm1fwQ7iletpOhn9iVM4TURv7xaZkREMTlzl396L7fcWVUTAV</Encrypted>]]>&AutoLotForm;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egVcy8RfQERXkDQvGmb9bk2xi/j5W7MKVRC+7xPhy1T2984f1IuEt1Cmq0OaOdnDhxmTqCpYgsAt7AY/pVTSM6AROkBMksN5iWsjdDbLBx8N3GP6hifc65d1+af+KozkW7VQmAsAx4kuKoYQSBrIpI8it/+6uzTWN0LVhXVeMW9Vm3XKGffdVFmbUWaGgN1W1yqlbVheYBcQDQ+EH1dDM0P8=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5Js58cXU0HfEEeEOxrgmkI+c0GTi3u3GcJUuYkTBz1odF/eOy2vHVZAqKvS+QuS5P8Yy/noBPd7U1Uas/7KwpzwFuPlBWulg09gHmMYkGtsVY=</Encrypted>]]>
      </text>
    </action>

    <action id="WIP">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTCnNyO/nzVDD8Rh1YiLvdnFsDunoWMudyqLQ3qqN5hhRIXUA15DDxS16bUY/xHaDSsUh3SL9R9AJnUm1diEwlxv1LAvXAMbdX6sOz2DHc1fselDl/bRCZWnGUwQmKe6E5vpo/b0pbDUdA+X/RiAANmHNQnUE4uCYZYizRnY59xKyGsj72SRKj8kG0uOjs5yCrNRWjyAcpT0hX014PSSa5B1ijqlNXCUZAFPqkDAqdVknF+ca0qF/424LBW43ja7acqFjzGTiQqJ8TQ7nc+fEKi+xtexqU7zhX6NdAxt1o17DZ97ckYrNi+m+Lxucf2N/Do9hdkRAN4bEQl/fROU9xK2eJEbtVGXd9urVdVmEUOpt/se345lkoQ3+HWcgsrGkzEh1tE5AuOYji0G9KE8VPX8pWLSWQ2d9wUzOpcKPGLjaoKX7kWEApnr5wDyuSi6R8MiBm2/7dqt5V1czGScNOsaLenr3ZZZHMIOmrCss+E6N60BcEj34laNMcIG6zG4YfZVnZ5sRhAFFGYqgAwRozfG</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSKYEZBe7ruuj/IhRtnJ4krpNhPFMY6hQXX5T/tZA08/nnk4gCblsozmfCYGVKkbyP3K30Z8QT1yKCbzIuReU5KBFT356cyKUmR+9Q0d2OUkOb7fStHJEJubt151A/ZrXf2OMzkytICyOv+oDYZgxfKk=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8Q9jZCpDncQ35A04Qny2BgfQUcsT+PoTSO8drTQb3p/8Df5D4yucGkIsK+LRmpWME+Ek8ZgPfPOCwAgyCjDJI9Qq+8dGmAsHgaL2TC8dZfUX7AcjoC9xCxqUWJs5PmMR2boAKfTth1dgMMz4HpIgqISH5pTEU25aGnsdb/6yST4StOLz3XP9JJYxsYL40WNqNMLnxS5ikKqETHpzjkSF2FOmAeCjqp6JSIh7WMkzyoqUvat0FhvAbIvSHfY22SjCg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Retrieve">
      <title v="Cập nhật bán thành phẩm$$120" e="WIP Retreive$$120"></title>
    </button>

    <button command="Lot">
      <title v="Cập nhật lô$$90" e="Lot Maintenance$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>