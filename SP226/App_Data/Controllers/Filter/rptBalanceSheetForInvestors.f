<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY defaultTable "V20GLTCDT">
  <!ENTITY defaultForm "V20GLTCDT">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="To Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9aBZKSpltVQIuTV7bxC/Os4kJ3uhs0hzU8Jcyq2cVNGjw==</Encrypted>]]></clientScript>
    </field>
    <field name="ky" dataFormatString="1, 2, 3, 4" clientDefault="1" inactivate="true" align="right" aliasName="Quarter">
      <header v="Quý/năm" e="Quarter/Year"></header>
      <items style="Mask"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" inactivate="true" align="right" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="kieu_in" dataFormatString="1, 0" clientDefault="1" align="right">
      <header v="Kiểu in" e="Print Type"></header>
      <footer v="1 - Tách biệt tài sản và nguồn vốn, 0 - Không" e="1 - Separately from Asset and Capital, 0 - No"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
        <item value="40">
          <text v="Mẫu ngoại tệ giữa niên độ" e="FC Form - Mid-Year"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1100---: [den_ngay].Label, [den_ngay]"/>
      <item value="111----: [ky].Label, [ky], [nam]"/>
      <item value="1110000: [kieu_in].Label, [kieu_in], [kieu_in].Description"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8B+ClTPuqwDYiWOMK7SNxZahZ9q+5xTQwZcI+/a/7Ftjulfa9fVQ+DOP87HoBE1zvLo8y85atVrgX1jhHU7+x8=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNPJ4Qxd2nPNUOW/sUYLUK1eqh2x30g+oJyuCKIG7Od/zaUDJfU7WUshPCgaoAV9l+R6Y8i24a8G6iUMQS4Lmy0GqjRZ0dPQ16aI2qigzDTtFB90Ywftb3WFAreyYXuXl+P3SyShXzhoE08kNufaY+2R2dQ3AE+lyjjrkRwFPNl99iHe+UBTJcuGAYKyyYNmhuOnTNkwjKXwK9MGxpRNV5oaQOY1C1cdvzSVBPzzLl6LmDUDLRmXixN8X0sHhrWB9rO98FRH6xOV82GJr2V5hqaGiXk/lQOk+A0jkFdYwgW2ev5jazJYgRxei3t+So1PxeHR/H81GFb53IFfNEt6f4OP1ht3/BYK2vKVF8B/7vdFLCqcePzX4lSAzoRY1WITXXg==</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9B/2wAHL1et/QE2epWfGqU3hTM6ZuLuDRO317VKtS54uxinFcMHrNhgnpOlD+wLggo7UuNVXDN4Q7PDYFlHC5UxI44q96E5PkANe99PrgJubT3ijGW7CNwr/O9fctuNQB+5x3oHbMEVlg2lh7jSyWg6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAv11pTV0o8Ksa6RoUBgt1lMLCMhBMXQELeuxjGNu4/Afz5qDs/Q0pNl0aMm9a5qF/he51y8KxtpR/+m4EzH8dsr+2UD4Ks6lcBW5mCOSjgxJBw3M7j0eek1E3D1pJB6+5p9hCNYhNWmW8zu1NyDq+6FFjv2uZ5PhHNMF6vF3cGyR7z7y70Q5rerYnvYptDRxloQRX6w0wOdRQsKKDWkED0LbYPhGDIjJRtcS9MJQAhEmzZFiEk8oU0MLZdeychxYBuidb7Otf3U5Cp8bdYWUxCfX7vV3/iFzng5dx5TXtLqkbTvGMXWBPc4hZRufPew5ixau0r825zJ1fNmkxaO3S0nAXMZUFyJj8RBkM1+kLUpoMOU88Mx5nMUPIskbuzN/5kw+9W1sz9E3NmDigt6VLD1bB4884Ezl1+e1zlK3O7E+mxkzwKil4/4CnmV94s9+nS9g6gQ1XpF7Df8g3SCO0JWsD8ApJjufstxalMakGWygKuqv8NXGZCtmyAtYmKzQyWjFKcMQzvxb2Bx7v4/WUT6QTUObs4sVARmV/CWUQuka5WKBatbamb9QqI/u9OF10PEvGHb7ori+Pcg0veLhUCUpzUbdLxYuwyE42CYoarc+MVdDFDTlOnUfBl/EBwZqfikttgMVEzupBdif/1ZeMj6eWcolNp/BG5rv4nPTLN79HcvdeL7+WTA2sa8HGX7OyX3GsG7ZOQtSKHaTThlMEYTgOm2M2DeWv/yl7RJkQ0skg/4GeMZ+W2u/1zYE7nT2dHtJc5SWwqqZbWDfQmA+SyZeybXSF1P8iTskGooIL/nz1nEYr74LJ4Vf8id3fN1o3O4KtZXMZCz73ZLenrmbqpmQt18axz6zYsPshTbTTtOcucI25pXwxWE754kRsoI2w/bMbXe9Fpv9ixR6H6juzUfsd47hwp/IPOUqhvikWZkFOVB7COVD7+qtWH4Mls8mULNp9od1VspUHaD2Y2ih4JkEHp7v9+E4RxPhbLvo1/MfbdxRnD4KpYsQio4MuM2M8wHiox3S3tSDvxpU8uXiXxcxWkhmw+LKakJwAI0R2hvpT8EVYthTRcoGKsbBJOGl4W5aCdIJGYi/K7sFDVIqvmOO1nLfiggA/MWmHZfn5y4T1N3BAn3OGOG7d7rUxEIeXK/kS3gDJyVhJc0I0i2GKbdmBG7E+bENPd3/2df04pSV56nddjYgnaTSOldSQnHvnLKU74VuOV2Qql1I3KEliVM=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>