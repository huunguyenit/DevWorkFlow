<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán phân bổ tự động" e="Allocation Transaction"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="@@admin = 1 or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1))) and status = '1'" check="@@admin = 1 or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1)))"/>
    </field>
    <field name="ma_dvcs2" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1))) and status = '1'" check="@@admin = 1 or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1)))"/>
      <clientScript>
        <![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTJUQa2uvfldZn1K1tI5zyRvcwaycEWK3Y79EFiP78KAWiUUiWqNknSzHp9EGS+F+g==</encrypted>]]>
      </clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110100: [ma_dvcs2].Label, [ma_dvcs2], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fIQbaUPWrxNwkwGfuAmbyJ7Bf5VbN3HnAuArhpYo24qZ7n+bFd8jb94nMrX8SnXEswZPke4709KPR9OH1Kc1yW293UOf/xsuYw7mTCbkaYFdzl6w26rWtZf1+u+i6MFGEQhMuhqyebqAu0cqJVKnBJqlqlj5eBMqxPwXOOFxbJFAeCAVI2tKgTgwXbobk596/0UVc1bLps2PWpV4FlvGnGBrzf0WGWn/0YKIzB5uG33BF9OgTFeprnpnFdmpFZ2DIOloWDtCOhPTQ4PpqCbHyWaclnVTJ/K8QmYwvnTxt82Z5Ew+FQYSZiEr3Mk7S5U1WrYxbI5dmgw81LGF2jUtopl6HZYiQ1QH37aKLGPCbUz9u3tc9NXV92xIdd6NECBD2CQyuwUJ8UdDeRyVFZX6t5tcul8kNqGP/1vGLsaX0QSvlECaNoLiRWWsLtXI4JiL0TXleMnmoICx1wSk18jVDg3sL8DRUKOLf8rZZpu5cYHPeGpmYbcNAi08djipoEbydM0a36dYnduKp4IfcRA0Ivgq9leifUyfI5GhI0vL7og30ATP9j/fItCwZFAiEJYa/h6N6RlZkU22GEo/wCvCiHtwjkWrkbaFrx6dg1e3f8nTMeB8MiiJ3cbKyOfrlbPXdaStDcbMPHoQfc/+9LgOM8=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3FRra9DrohIiIFbEuTaV0Fn8dZvYBZg3OY/NIoo7R3qx1rU8iIRVzQL3rWgm8DqWyODFSv9i0IArMJd2sMnQfMGAeXt6mCK4jOr3NQME5fzYAX7pu50UL7YJLIxhV1dIA==</encrypted>]]>
        &CommandCheckLockedDate;<![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxExNuFTsy+n3jk1PpdMMNIifJitvxbDsQmCpXNYXPrGm50k1KM8cY7JsqtkTYps63HQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg+uaNciGP4DcMpC65Q9fBs++n1tNCDIiAPHeCwaj0tw3V0CkuPt+WtvZB3R0kLgzT7NGCht4tWmFB9QOd7O2hhVVuVqgzC3ou4aGh601sNZRHbBzS8xD06EZ+FcCU9g0VI3rVSOt3nEZM20h5GxCOKhIqchd3Z+Mv84lRfCtvKhSr9yoyFzHPELhs5KpGG/IqeRUpgyovLUlMd4TSi9VLVTQWP8N7hcePuYt6vLsyzd0gloQxogaF04Ib8nC45SGdS/BdUAyL9b+qNEidJrsRw3F6Y0EZTu87r2Y34nrPg26+2mpmO56XRURYer02RSe7VdU2/MmQcpojpC784AOyaomik8MckAJF9mXgNj1E8eoIDgakOHMALdEtv7xnbc8QQGS1ZuRq69TV+wGFPO29MdSee/uHFFZjhp96iwK/yNTbIK31d/wjqRQlp24BX9xu+mNIgAqHKAn6JmZFDC31a2/pnvSexH1v2/rqwbA+2VyESjPtUfEcJMzDxs25sIGDxlRB99AttPbxrWcC13BXo5AnNXqqFwaP/7F2V+Q9aAEbU7XP66DOSD/pFxpctemogduXLau7zoZ9kFk35N5DijVD3MNkpnwYoXbqO8ZATyECehg5OQjUH30DXqhBjwidW5jdmvCKVvafqK2BhWawk9CPI97kCr6xWE18vjjhyHCbHwidUQYV5vihCvUu46sF3I7gDbEn10RG2QD+9sEP6H5eRFaORoDX2VPp2Ui3uXVPiV6vIrxQZVWhXAxEgLUKE7fbu+sjvZA0XjpdL6v6Ln5OzZSv1zUTlY2SMzZB/RiT3FnM4W8ORfL0XEf1HY5tQyLzBrUvqvVGCijY2yolzU=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Unit">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dbTXwwhuD1u3W0RUrvieQetO0yiOUfh8QUHmyXmdGpSU8TYoq6U+i5UJaNYSct/FtqRSRd2f4/DsCf4CRlAYbwu+75sDZm5KhEXt570KBnSMEcv3+/9UeEM3hGrILSoWjcxgQKNwZnCq2aq3BS6LBKjcYTEWZ5pauy+1Wj8PsFLAsl+W8wG9Il2E54Bynq7y+NEPRo+upnFv4vF8dnYfMHa8aEwj/YaLYYbofhyUGzru5XI6PJGwVdBq+zFbmYnJ91eyMn6qNEFgIQzmNLhJHc/jfeBbkkoc/e8elZm2ZTXlbNrLPTNlVWE8fRXIQeucg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>