<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "S1WIP">
]>

<dir table="sfctdmwo" code="ma_lsx, ma_cd, ma_vt" order="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật bán thành phẩm" e="WIP Retreive"></title>
  <fields>
    <field name="ma_lsx" isPrimaryKey="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd" isPrimaryKey="true">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="item_list" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmvt" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_lsx, ma_lsx" e="String: ma_lsx, ma_lsx"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_cd, ma_cd" e="String: ma_cd, ma_cd"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: item_list, item_list" e="String: item_list, item_list"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0, 0"/>
      <item value="1101000000------: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="1101000000-----1: [ma_cd].Label, [ma_cd], [ten_cd%l], [item_list]"/>

      <item value="1: [dmvt]"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOYuIxGmv1z14badboXHMfyosnuNeyy7Xhn7fQ4stUBw</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TVe3dXz9HjfxCLG4Hl08lUC32h6lmNSkhqUlM1NCva4</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2qIg7ORFW4onU0sZneENelI8kAAfgeONfN9RsYdOnnBWbtxuq2qh5vlnbyXN2fvL3agOxW8mx+ywH1ItkRGG2tFjHhdru6gubzZzBATK2JVG2rY1GUQvuTN+rNat2YP4E3k8t0CLGveoIfrWdYFjevsbY/0EKheFVY/VG4OJLiKk3pJwEbTXF0Gu7YEeea29EmFlV/YxYYJI7jK+A8vyPnYoHXJpS/gGsA3kIQIi+7+</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcx9uz47TsxQCyaIFm0AcW6xxKRjupohoJjKLTWmZ7PlR6gDieISA3kz+LtVL4Aijzsg7/ewKRYDBzXxzJtFSGGg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdUoWcuHR4Xzu5ct0/PGSjE2ag1b7TPXlzi/K1wqVy5igf0mc9MdBIpMYIBfkrfwRw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBgh6JKldDxvJkgK3J2d9KQNDFerrcpZkZFa00U/ibrW8tjLIXEVIOjf2fpyY+Sf/Gu8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9HQyfpu4ix30Q6hY2kRCh83lBYAQ+dIKSb0m5Iet7GlyDeUhOAihQf9egPSVw3t1QNVBk9C/6zUKGT60K79iE1EFjywif3B9ULRrKhImDZKTWexRfU/CWwndGswYLimdZ/MG5IC24OWjVLx9eIIxmSqd/3XAvsUkLy7ooIngc6bqjVBj42jFUz7KuFK4IRSrz7KQaF6iuuUisGWcyCNdhsOcf5P2Sv/mF8m968M4G6m0CDTsvm3N1saUj2zLdFGYD54l9vzaxiFS+SKhbEyUh94XrU4kAhwrxeh14M5SmG27OS5LMKfunyqbTJ7b9LBCQugEdhDNnTKwu5qziE1jwApZhJm0hGxDM6q9K+ly+O1fkjDZ/WINCfwNI0SkkaLOTTdOPG0uvHaNUyv5bPATgk+wr3uM2l1yL17TgXTlkyJq92iXGkYJb3lIE4d059VtVY2JbKBBXidF1fRW3H6tQ+G73nkEvv7UNFPEtMoxvvp6VmxJq8y7Yppcyj1YYWlGj</Encrypted>]]>
    </text>
  </script>
</dir>