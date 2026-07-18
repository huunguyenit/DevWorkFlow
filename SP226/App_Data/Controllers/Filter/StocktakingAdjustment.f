<?xml version="1.0" encoding="utf-8"?>

<dir table="kkdc" code="stt_rec, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" order="stt_rec, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Counting Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Counting Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Counting Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110--1: [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLGAcrbSHV0QghmmHqbU0e1v169c1o67UoOiNujM2dIATB/rtjBmOW+miUEDFtZz5OVCqhxNSdsXV0B41EbbQY+R4f4AgFejA1s2zC34vHog</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCi/NITU9stZ4eq9/aFYrVbeasNyMN37c3GTVVEvoNQu8kRuuG9SS4Jzs979HmwfRuHfLaAV/useaSEfp03NJC/4SWEdoa+PVv/Lqt6yhk8i</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAZkFb5yGOVb7x43G/CE53+0lpYA6TetATSZC/V7ZfgalQVcEGGN0R6+apq+KiCExy/xlpbSDtV1ZYSNwsoWC6332hPS3Ky5cyDX68RHI7VX</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBj/ChVNDvBq3mzdnF7Fxj9HnOVwGSgveq9TKsn5hxVGhAhwbRC3jSLye2Z1QpGghX9MzJxkX+9RyZiGIVwaXdT0PI/JuiJDL5/pp8jOhEm3ZDQVpo3mUKSLz54uAj1pnNIUv+ugDCYarrjtTQWd49clWosorPSkEGHKtPr/HyeAgci5Ul5e+397zrpyhg+xGAJ1zVc5ZlXqSVUQYjXmAIKPIT+C3Y/SQp7ozxianEik5nX2Fn7W90Ofl+v9aoocV1UDmz8XNG8IUUEn0452tO1o01kWZy70TaxEMYdXo3gBNF98TADJXQB/BII+X3JdG0R1HHEbMIePvX7iQJXeHg+/4e0XG1rKwPzTiYgn9l6TH09fBYP71i1gp1czXE1xLATvd/Y1gFHfALuFjUDYFmOdyTFjKs/1VJmnXjChfasRkvVvBJ+hJvy9dKpdFZ9lplZ16Wrb47YIK0jLBErSPJO8yY69udk87B3j/X9eHXV/iwResBlihdFiJiJ2FUIrfe3/45q5f9IjYuTjbU3xonoixfEiivxEhF6kOJ7hBzrDHlKitHI7kJ6btQ5paEpufM8WzB7tgps9Gyh1co6hRDqDn17v92Hu5z5/uu3nNXoFdC3NbuMsqYe3N0YI7vI8of0RvlrWXonwK21hJ5Wjx5vc</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUyBDhZdB6fkZIZSLuTUcxyuw68D734smA+RM/4BD/dE4wpcTgkKOZpPIK47m+8lVZa3Fw8bDj5S7sTmzLuxdUi1BdThYE9Wgrr2wpHrlm5IoE7MHlCNCxeaDt57feMY1+fvsOsh+JFRZRCdjGBaGeTRkuxPiGGnY3KKYitT8hDsV3YPHlMtlmdBAH4jaHCYODL1ve89cyZl8gjpBv+WYUVlZjhPwvBSgs8bvOBIhndHdYVUXYxPDSS0baOyVmXBEV28VUTpoO2CN5Crd5FpT5VGB4FsrNhbxvFBISne4BG+vC8A9ft2OqmOeyrwPKHO1hC4wVo3Uw0jykVL46eYkgdJcJdzXyPW3qvsoKsCmJ3nF11fPEY/KsD13jPXvw5hxMMqGThlvC09pKr8n/KRndinjGTXf4rdjRnmLZKshj4K+dS4Y+xoTemEsu9REgwbLm8v2SMfV7KP7mTiePl/dO1G/VOmzby1vTE/Sn2RTFIuAXxXjPor2V9Yj64Wc40chV6FHeae36Do4R3mqPkbdQIAvtGvXF7WY3st2Nlqu/jLBdZBCCUqHpFUuHnYBjTG3UorbeHkIh48YXhfu0GRhBGtBsv+L18ajhs4lMaWsPHydR7497i2RZcvaqPMzZMYCHvOnsRDFRpdaFItL41ChcSybIy+YKZnEzLrkR2xpvXrxKGys2Zrl9JkrmAKLaKdnLB5JVcdvp+rJ/EzT2lePLpKoRE6DXJK1HZ939hbFcnVbPHgCZAWcOvYasjrc24eOr1EN7SyMMaN3AxUOImm91PXnKE4Ns7RXCrft2bKKvASL+DJIpPqLjJBV614W5H7f0KC9LnpikYazYC8j4NCvIkTlv3lt6zIBMKgKvObjLzgGX2RT7XtsP9IgKvrEspI2TtaI7q2A+7pYIBWfQcU+K1nrCrAiMn+BZxIJeMTo8/q/i49FsUlS2FbNxjOnrMHpwb+p+qoqaQG7G5iu8kgFFum9hwnITAYqzEn64mt5+Ig</Encrypted>]]>
    </text>
  </script>
</dir>