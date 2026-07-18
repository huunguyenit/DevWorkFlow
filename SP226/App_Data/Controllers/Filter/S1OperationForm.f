<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">

  <!ENTITY Identity "S1Operation">
  <!ENTITY DetailTable "dext">
  <!ENTITY c21 "Mã sản phẩm">
  <!ENTITY c22 "Product">

]>

<dir table="ms4$000000" code="stt_rec" order="ma_px, ngay_ct, so_ct, stt_rec" id="SF4" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn công đoạn trước" e="Select Previous Operation"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_px, ma_px" e="String: ma_px, ma_px"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_lsx, ma_lsx" e="String: ma_lsx, ma_lsx"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_cd, ma_cd" e="String: ma_cd, ma_cd"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct1, ngay_ct1" e="String: ngay_ct1, ngay_ct1"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct2, ngay_ct2" e="String: ngay_ct2, ngay_ct2"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292" anchor="5" split="6">
      <item value="100, 100, 237, 100, 0, 8, 58, 50, 100, 0, 0"/>
      <item value="111000000-1: [ma_px].Label, [ma_px], [ten_px%l], [stt_rec]"/>
      <item value="111000000-1: [ma_lsx].Label, [ma_lsx], [ten_lsx%l], [ngay_ct1]"/>
      <item value="111000000-1: [ma_cd].Label, [ma_cd], [ten_cd%l], [ngay_ct2]"/>
      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcC+NhoxLE0z20HP9OWAEx9W1AkirpwPOCnv5bgg9R8/BDfWseTCeGkIzQIw+CWcS2voUp/rGzlRwez4eXOzY9eg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc0T24rU5HdPOvY0VdbCtAyNH4KGGRqhYzibxYZhRvxCQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/8S6CRZbHhun0qB0gC991COleNnstdxhDM1VGGzQh3O17h1i/JEVFxqweB3X7D6GqDCv2SbWcOafqujhJ3T5PIRc11C5R6wnZvA8x6/vYSCFkFP4eTuy5NT1SXikalAQw6kZKjtBKSXk+x0PwdIymmmhnE8+FrBqwvQTdhF5E8epjYURIKp7HHwG9FYWGsElA1i+byBlQbnM/5ED9iQpksr/6LCCW1WgOCBV22uHVp/SkUjiGubMmxXD7GhJVFA0vPVAXvLbTLmbWTeBaLJ1GOKISwQxDmRKS3iceBz61cpY9VS0puiEMw5TJeUPyZxPj1JHo5POBe7k8VB0tgDs9gBAVnGqE3LyALQMWdrYfVk/DyNNGJJgdecC3M0TTWz/39tAFejy0p5GUTDfi7RJJwc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/r+iVrzEbkRmWeUPk6rctFJwKFITFmzUxUurH7HyJsOQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/5o7Dde+K2qQe3Z9gPRKbIXaG2gHts7t/84LR79uYrUAobQDzwD6fX8o3IpjZMrqHY0/C/P4ME1e/y2MOI9ynLA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/+5eIMzAowykGLXWd1AAH7+pLlAjxcHpZEZDYpI9X6+KyIrRZv0AV8jX1V66UuplDQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggbtekBWPgTd4aXOAMpQJ876wJpmlelAEDxW8nFXXpWLRQe4ewhybBMxx149PCqez0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9b3UGukxle1s9JIm8yxaMk+d7W1Azf8C6mzx46EK2UNk=</Encrypted>]]>&DetailTable;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunMVf4RsEAdc9KhEf7JQ7glRXoSTiKY9C3JCII/3IZD0voFonT16Vas8VdXdMmluj+2Ic8pT3PiTpeRBGF6irL54umJXkp8gbytXxqV8J0YqymofqjHKXGr191lL9sj7mRjROagKsDGZQ/fm3P9kvkE0QH37BLn+q6mSXoL5273rZVE2J1C/QhpMNvGUv1i92UGN9n9cddDGm7wiL67+e+/6zQlZ8SQFFacujaI0QtuSM2ur3n3f7f2+6t/DAtNXr5bNI3sDk0gFimq2hRqIswzRbxe4BHgkqO7s580ITCokj5Bcj1ujqHshXg8Fj78wyWcHMZOkmRpYV9CI0wEWRh71BJ4SsBYHNJcLlQA8o6nYLGbGdV9bhpnQ1kQWbg+x3HTDuG8wjpOXb//vuqKJqmJFh7cWlY1NtzCdDGUj/Dx5zh3lqu8TEPduQpDdS4ZRl2a/1872Pc13A+jVfNSw0BAOTxNDtcMiaLiIvuCairRvRh/y2sTqVTT44L5NGFJ1ZuYFO9FQn4ptZBrzBnOLOaGVtc1vDs3ZzWgBX1zZNfAJ5TXJLA9bXf60XT/DKUrsflz/jUjC+sqgnQwwnm+AKjSdwUh5MHCCDh4XVi8JhTAJk3vVNUqSZcDachFupBEpolWYTBGjRk89VKKqUWynzaSWpYpkB6YB43Rc9Npq+m5g89iDP3GZlJvbSMCGs3oVubER/FtWLXjjkRL2UON7SgJTBLOVRb/6YCWItegBbKBDn</Encrypted>]]>
    </text>
  </script>
</dir>