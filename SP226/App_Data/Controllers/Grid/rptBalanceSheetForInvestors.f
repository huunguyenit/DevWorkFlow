<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng cân đối kế toán chủ đầu tư" e="Balance Sheet For Investors"></title>
  <subTitle v="%f1 đến ngày %d2..." e="%f1 Date to %d2..."></subTitle>
  <fields>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="thuyet_minh" width="100" allowSorting="true" allowFilter="true">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số cuối quý nt" e="FC Closing Balance"></header>
      <footer v="Số cuối năm nt" e="FC Closing Balance"></footer>
    </field>
    <field name="tien_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đầu năm nt" e="FC Opening Balance"></header>
    </field>

    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số cuối quý" e="Closing Balance"></header>
      <footer v="Số cuối năm" e="Closing Balance"></footer>
    </field>
    <field name="tien0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đầu năm" e="Opening Balance"></header>
    </field>
    <field name="flag" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ss" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>
      <field name="thuyet_minh"/>

      <field name="tien_nt"/>
      <field name="tien_nt0"/>

      <field name="tien"/>
      <field name="tien0"/>
      <field name="flag"/>
      <field name="ma_ss"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idhWkuYddD/oQeT8aEJKa2nnCmaWDALhMmIW0lRM8qrTR+4UvQni1eC4ArnS9oacd+ugbDxpfSBonQE9z9yhc8mcWvB4uenw7Xt7JXvmtz+MNTkIKH50uWQq7w4j77dByLrM6PwQDzb5jnbVUiJVSZEDQxlJmTjrzjd2Rtaj6zqF6tNRlIvKqqon+7S9qVS0+f6xDMjoH3UN/assKKb+cdl32c0rODHPKtTJlQw+WvdfUlqjiLf0nW+pEZvVZIgRugBATUzgok5nSjP5z5Yo2bxxMwMeXQgPtLV3uaEKY9zqCgQfhbCB9XvcHGuZEh9xFqb73aBII+yIj+dh9nEmxVQx9o/3macI5yx9i9xNVdVMtl8Yq7ndCqjcdCKbI4fnyoTXg9nMWDLTdebtStsiGpCTBB3P2QYsNFAlKoyR6ykq3fWsbKGgDWVmlb6ayqEiwz7ColunKxEfdl4dswLAK36nkhYaEYEFsfIyxMb/JoNlyBYTtSAH4YWcbo1mB5jPVC0CYlcmWa6HBkSm1r1Pq3MGY2ERU1d+UgqaNoxbLuyxxTevXMXTBEgsojVgW6VgeG4MU2bVZQr7UN3pjnRM+ADLt5QEr70i4YGJd+4T2mYYdc63Utv6XV+i8uZrfyyxbs2G7aB4o3EGsSwJqPlyeNCUd5/Sled5dVU4eG3krCSPKDtbZcsOXNovLBbSZq5yET8YzFiynB49tleKTi8ZrhkTjHemFCG7VSsCoCAbg+0hv92MiK/GvUqZN2/SP3OTJxFsepFHOWASuj0sKUbdfuISHT4yS2kspMoKU4SOPyaiT9laEgEnXxEnFkHDkysx/SgZPs8gN8mvNSGbmp4MxKdzc+jw/TFbids4cKqbRY9Fk6ep93zbwz6iRBWQiy93WqHszhvIa2qR7THG5w8GnXt/uPxVbdwcx+ZEw8pugKmxGLS0L6H/z0pGHGn3O4XOi4vlBtXVlEP0eb46QPVBxHzSv534vY1JeQa2nnoZABCmu9+Ql8eBJUtNaDFtM7zQwOh+R/g7XHw4P3EtrUgrZDBsV0hrxOcvfp2Bi5i2qz1wCdmcCQHvq/jhs++NDmDQlhSpvhVc1UtY4+1dbf9GyD8fSAPjZIw39ieHt30+gIR2eGsWWeVesKzY1zoz867HfQ+hva3Q5N1VtYHkII/zSw0NKDJVVdai/9N7L6AsDsTH675WgW3v39AZJcO3BVJyw/VsuzVVkf3e1AokLjkoLX11TJyiOTkZCjDtsdtY6idayw==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>