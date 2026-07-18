<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrTSRequisition">
  <!ENTITY DetailTable "d13">
  <!ENTITY c21 "Số yêu cầu">
  <!ENTITY c22 "Request Number">
  <!ENTITY c31 "Ngày yêu cầu">
  <!ENTITY c32 "Request Date">

]>
<dir table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Select Tool &#38; Supply Requisition Form"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người yêu cầu" e="Requisitioned by"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
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
    <view id="Dir" height="268" anchor="6" split="9">
      <item value="100, 30, 70, 35, 65, 37, 100, 100, 8, 58, 50, 100, 0"/>
      <item value="11010000-1011: [ma_bp].Label, [ma_bp], [ten_bp%l], [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="110------101: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcjVax1/5xe6D7rk1BGQjjJzbqjYtiDh63vU+/UQo7Um0c2R4WqjF2HkndNmYI/C6yX2ULCxVlK0R8n5PyPLwHjPkq1CEbUGMOxKQGwzZUEiE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991CMDCBhyP2JXxBafrhURA553eWTeykZ2zQpyFBJpoVWp/WXo3e1Ui9flaCfuBAWmtrPHwi0OUInhrB4Y/0/UR83pZtkl0hC+4bYeRA3PrL/IX0hzIGXmk2ttVG+WUpwLOGz8qxV+X8hRV8qPRk0Zaov2b+xLJSNbEyNCacToLKDxEtP4C8k3XC74ZcxpIXtLG/lk8/R9RMZeR+48dlyP1l+FA/A4iQcrFqEUC7X10nIT+l1RPl3U7JlPqr11tOHfGzQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggOuY1sK45MdLTfrd0oo/Y3XOnIV1Enb4nJzoR+z52ijw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9b3UGukxle1s9JIm8yxaMk+d7W1Azf8C6mzx46EK2UNk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunMVf4RsEAdc9KhEf7JQ7glRXoSTiKY9C3JCII/3IZD0voFonT16Vas8VdXdMmluj+1bObcmvYIVYxlcTZUCQc8NpNSbkMLJymq5oOOK+xe4haTd0kXM6wNVzUaTfN6L8lYZsUlkSW38s+omUGqbOPPtM+t+ZnUm3Enb6tZap9nkF9HmRjmSWNeRj8qVwyjxgqJtUqy4bVGaxCpTx0XqP+3lI5NmY7LHVO6jRDO/BR6ZPou1hBoDFdOu7ln5iKfDMkpYvkgBOfWN9JD2+2bI+21FM8JDu32d8KhaaptF3ZJdN4Va5eL9tonLBHRVUNvxLz7cmkSuyE67f9ZX0TlIoR0GlciHV0ep65QqOqUDvtUDVoyAGSn/rKxtBHD7GeH08P6tWgXBMjX1hb7+9YX0CCq747VydrCaKawKk+Uij93B75iOv7rg48IgcVMI7zTtHKP1pvfCsZcJRZvKwVeycZlVcR42iz49N6JIHC2D3fOv/2cNrzKT5d+1pZdt4KXmCzbTtVRsNG5fygejdBo/w+DtQnSSyfR1tFdyff5645G0DbiKENlhVouQJi6hf3R67w9LTAeAOxQShGc6u2SyhBoesJxiOCAk2O6G4PO6QrWSp9t9bCFxaa5Hl4DwLAKGM9A==</Encrypted>]]>
    </text>
  </script>
</dir>