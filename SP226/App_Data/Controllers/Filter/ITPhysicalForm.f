<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "ITPhysical">
  <!ENTITY DetailTable "d65">
]>

<dir table="m65$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất điều chuyển thực tế" e="Physical Stock Transfer"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Source Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_khon">
      <header v="Kho nhập" e="Destination Site"></header>
    </field>
    <field name="ten_khon%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số phiếu xuất" e="Stock Transfer Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày phiếu xuất" e="Stock Transfer Date"></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="11010000001101: [ma_kho].Label, [ma_kho], [ten_kho%l], [stt_rec], [so_ct].Label, [so_ct]"/>
      <item value="1101000000-101: [ma_khon].Label, [ma_khon], [ten_khon%l], [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcaMaHrzKwD9A+1wE7pr9E19OXm4E8Chcm+8UTLW1DCr1y/PDQXykZvBUeSEmM6JYes1WZl95HOEquNE+7ooONOQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CMDCBhyP2JXxBafrhURA553eWTeykZ2zQpyFBJpoVWp/WXo3e1Ui9flaCfuBAWmtrNT2olA4H9iLU4kjHywnvqDjLSoeA6IUYv2UUHhwx31iPMDW3st/2eAEON0n/07zrYrRM86+PYmHt+S8ie42vSHMdzE9bZaUrlemkyKhmZADgT3J79qhIxPczUKGbtryJmkalFDFEiqhPpoEy7z0QJgbLnW8YR/qk9Pjmh1MOJt40ZI9sVqG7/wuYAc5JosI0A=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBgh6JKldDxvJkgK3J2d9KQNDFerrcpZkZFa00U/ibrW8tjLIXEVIOjf2fpyY+Sf/Gu8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9d59+RlvmyJgTEncGAf226VnWVB0ZSAJydTuhQmIV1ZRA0fmTl1G5tZHG8IpOBSgLvI02OKfCqCAuDfl7Rr0L+9vuFYojlKPCCcIAuA7UCFKK7HCk2DIREi+KBmPHw4jbftsqix53mpOMNTCX7V8SjR8GNGaZwHCYtSF0+1cqCk8Ou62FkMC/lget+nQA7At4pguQiODRzIcmiT2OvSz2JU5/Le6EjHBYIbwxFUzLXwPpkAjwuQ8LGIZ3GpzF8XQhOz9H9zVj/38CA03ASIkomq0wwMAsDAgNG1W/egkRzdx2ZY7cBJK0g9vSJgEETRSVLnAJ5T1kmpWQ5zV/5ZWzqy/2oD8K4YppIooxIU4BjQIwQgbX2sugFfCGXZjl/1pSnluJu0jO74QddgAB9V8X0FHopSb6agZ1bsPA6dl3JPy6Wf+vaiGhVWQiP9SUgpEKXmjz/gDsC9mKzy39zvcG6rDPambzpnaBz6Z5ZBg+t28=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFWwlwsYWM+hg08oZhJEqi1BdXYllSYaxkmN++oVkkFwAYyR4BdCTH4A0vTjcJuEhsG2zJtNLG7/qi/BURATi+mGnJXr/UH8yrWY6PxVvWRP567QnrpHFa3hCwjMog9+f62aq+0vhuw2lHLBALpz3fW/TnYhw/nRbhhmOKAaBnLebh4BUrkRik4gsdIeENk+BEPPB+CiM4sSjHKcoiV+RkVBHay9iPI9mdCR2NrYmhlZBGxxM3eAlsNmxlS0a6tLDKr5iOrpgx2H9Bjqmv4AzMXAOxcaoir5FjSZSKON44zUCvw1AHmBzwv/zStrnjvgCAy6uHLyqehEncIGLOtOMqOP04xUiIbrZ74gaKigE2fvM/jkdqNMGWiK+6EONj5wclHBB+TPeOMTQjTr2KjHIHeqBwx5ukxUp12j+Bw30ITuwMXWflwGBWk6+sVbEL/mBQTkg7cYJFc/+opBCSSqvzhKFPFfNW8fM/vC331KaBdjP7Db9duWuyl4U3g7KJBCWwBAtVtKTZF5gxua9rSCOneEJS5evWiD9hocgOdnSsIQqRJMvgk/KRlex5gX9jprpewGFD/Ntkig6R+i2gaHWBTNIsRLMVdwbH33AKJiXgNjwN1U/Kku9rwL7UNdqHfKL1TJ4Otw4z7xbv1I2DLAJVIU/o/C7Vl8hDMwcvZs6DXU8tj59v8Pgq1gxNYPBsNMkg4uPjTbvPzCWeGvrlBNUqoV0aOdaCwuoaXUPrUmDyyN2bY5Ni/p3rZqMYtVcno4Swqtw3Ohr8SooE8zJ6EU3DudnIlb7SzpUN94zpxDqyv24wn1XRgUH+FnoZwGxYy5cy6VH+2nMuyBnkcAOCWEjIYy/t8uzTM2NuKfiJerHFNvfAZqsF4B4v6neYe5vgEGPTwSW7vWT3yFpePQB6m5MFJ5ONOpS0hmoaxoJBqeOk70PzbrPnngZKMWU1jtcxkysjgZs2io4cIM+lD5+jdoDZxKWolO6kmIvx3g6kdkVNRL2NjmbDEs/IOAs7KS/LGvJQz4iotjAam38DEbBqUAOb34ckYThQ5MFcHvshLMDkoUyB8s5q/AcfY5ouDPK9KU+Q==</Encrypted>]]>
    </text>
  </script>
</dir>