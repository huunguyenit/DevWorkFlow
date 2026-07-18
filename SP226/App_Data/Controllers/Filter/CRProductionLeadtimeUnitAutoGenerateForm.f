<?xml version="1.0" encoding="utf-8"?>

<dir table="crdmtgsp" code="ma_vt, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo định mức tự động" e="Auto Generate Processing Time per Unit"></title>

  <fields>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" allowNulls="false">
      <header v="Định mức thời gian" e="Proc. Time per Unit"></header>
      <items style="Numeric"/>
    </field>

    <field name="crdmtgsp" external="true" clientDefault="0" defaultValue="0" rows="330" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRProductionLeadtimeUnitAutoGenerateGrid" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: nh_vt1, nh_vt1" e="String: nh_vt1, nh_vt1"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: nh_vt2, nh_vt2" e="String: nh_vt2, nh_vt2"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: nh_vt3, nh_vt3" e="String: nh_vt3, nh_vt3"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_hl, ngay_hl" e="String: ngay_hl, ngay_hl"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: cong_suat, cong_suat" e="String: cong_suat, cong_suat"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="391" anchor="4" split="4">
      <item value="120, 30, 70, 533"/>

      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="110: [cong_suat].Label, [cong_suat]"/>

      <item value="1: [crdmtgsp]"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIhRSUvIKp2cpx3iODAGek2rdZlFEJZ5cPz+RKBHeQtEpFVtMpkAVZoRezwmmjiYzoKZnFk4IDotGwsYfI7cmWVxdPrpQb7DRkUpzwzQVsJj3YMWMsImZK1NZk+WhHSzjw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJoMYJdWiVhUlC4zE5Pldllgi3CHmrgWp7JJPap2b/s11T7zkU9p5yNL7eaLsaeVsb0bN1GFYxjrnSDAnJMcOGFhrtZtqUcvduvjGh/ooS8JlTVr+tjWrqThR37s2KFOxw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdozVLgt2T5wAdB3Y4uX4yYfzXwuZIMhkFcN2ZeA2cEZadG7ZZzeLKJsSTVFPTTvcrkQ0U543DoGwduGJ+QvnU6a6N+DFUmfH5neY0tz/MoAetidi1f6VFZJvkcqX6TyRSPFCYcawX0bYLbt9riOZOYNLXoSqFNLOjwJrfI4TN9rHLtoBLFqLixJFfDFyPfWN0/rV5+yuHdq5eNi7MgbgQe86mFMzT2xRBLQdoWzKuqNSqv1yrnUG0ZDMFP+x7bSBUwQRGJ6FlG3qfmDoIBkR6jBJuF37OX5i2gZSLvu2L4H</Encrypted>]]>
    </text>
  </script>

</dir>