<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid table="tkhddt" code="ma_kn" order="ma_kn" filter="@@admin = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tài khoản kết nối" e="Account Profile"></title>
  <subTitle v="Cập nhật khai báo: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="ma_kn" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_kn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="serial_cert" width="300" allowSorting="false" allowFilter="true">
      <header v="Chữ ký số" e="Digital Certificate"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kn"/>
      <field name="ten_kn%l"/>
      <field name="serial_cert"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4apNQlxlv144cR++B7WDcrV4WJmlptYDb4QqMkb96TA2iUZKTRlDKpxLdchq4mxKtJptqRb2PekgViR21oURFS2u3qY9ql7oAx+k5jnluHKcIwwSofzH2trcsV3WztMyGicQihV/C2VuCj+FlKYROeCW6mGVEwrjUaOADiXRNpDFK/2IiMZSGFHtLrp5D8qYOWSMvXwpr0BvI17W9LBBlECXfEbFHy6hjTAPWr2t3SfvHJrcPuq96GzoBA9uU5MJa6JEknwtCNaiwIel8umN7s3c5lxWc0dS47OVmkq/yCpl0Aty7p6F6wIvEQzOUvgOLoG36+fTvausxIdcwKtG2dRTOSo4JR4CJ7kaICY2gWA+cIMucOcA70MDh4puVhvbxXLnSEnWp2XS0WeyTZj0r3ZbhhDPjgKC/KWu9zK7SMVUm7xtPORwIRujo9KqeuiNrO6F+062fiOfgUFBCWzkb6sFJuQkChc3Mj72gBNIa2GD86kayU09m+3GsIuVsZqgQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPmrMfiQAOh1e7kee0/ys5UrXReiWidTk5JMdkL0uyF2HoD7HVc6Fen9tGPKItoEqugzkIuLBfytj2sXr9qMC21QsGgrvYGuHZ157RkMdMStozr3IUx9T6gaAXji0BGZtZxh2a475zr8ov6V3qvWFx3G++WJwvCY1f0DhtCROyBkTNagEEPpBu55v8EBwgZkd1OZ2ToAQED/4cIFNI6J7gBuaD8Ter5fBAlde2pb/1ib</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL750okAsOEvx/kVLVmZNAbMUZKgVFfsXM2C6/hiSYSArRzpo4/6/sUc2xaMDpK+Cw36UtoEgB+/rAI8xTmSKrazAM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJta05ZEwWVFJq45Y4nCy9sFuPRGdeIqKyXIvKsFES6yxGM1GTcWsXx+r9igPCRdnvMVUKw6ADn21uNpmjd9Rd94U8bcbe99c88k4+JujKEP7VKnKsuKlAd4E/mCjBEGsnTPpJ1UjFVIZrDnRLwSjy+Vq1sLDZ/Ot+eVzHGK4Z4b+9OBw77d8+a8sfwugH9609Url0OTNES4SrwsptdvUzwdzjOcNYXKLihCJ7t6v87lOWkdsTbEjOKXkf9jkUlmP37O0ZsTnkNg9WF0GQXSIxF5C628gND5dxj9YEBHftjY2VbDRcTfwgcbWc2UEtXtVt1zb0FirG43ThyAv8wAHWWp9DxnsPvyG9h8tIYDH1uXEG2qXRaGefGZIlFZx8EXpTpM7sr1NLW3QMm/UWEJPYMaWOTX/lJ21ue7S8+KMRAZjnLpZuNJQRwKmyFJl1jlxZ86EzTpExxmAu2UmDjQ5+aq0/gnywRCN5M56Pj0UtZJtY9Sxba8Z1583Ipe9ZD2xZBOEcPqapGdOnAkFOUjf7PFR1uYnuBsw6dYc0i1Qr6saXyGXlsMj+QoJ5+axRwiHwQgw4b3Ep3iqsjiPBmDpcOQMJ+Wqa07I2wuBnJ6j9n8unE8WJXlsvhnIjxrIBdCgZshvk89imQnakVaeTQdySBdXs/w2IoxtqHtR/lpxgAXF2qDPVN8LpzOGedIQjTduKADqOutKP89H5yddyi4/kf7yI4NMj0C2knoQC+qpW3E9v/9/n+mmcC7rNMyqJCF2OyU6wsfMdulnJvZzR5hz+NgaReEtMB5Uxa1V9AxDmJOPoOWWh5WD4HcH3Y50FhZzx7iY1lTsdQiX5Fz1lw1dPCV/KrfOlUwUVIaC+dKjyg1/IM6B+5c1hET6udJfxp40wJHN1N2yFRw+oEcxfYwHcOoI2Rtth73dCdwFRiy//DsiZ7aYZtGZA9wB6PlxQPWDjp5GlzmxD9KbxNO3IZFPVzJ8TZ3/RgK2USIRJd2Dp+EukXl7s05Z7RkgRDfyUXH0nskIg8W4Lycls/5W+dwyhwXjci7OYXKdSYZTY0pDe/wCt2PxtVXyEeiaqfU0xLtFM8bE3ABffjCTFndqS2FW8l5JHXNhlCGcSaJA+7THpyukma4Zs11UlInynSFxN7haSmPILMWaaSu8qLTDahdTKwVKgi0kDLFnytlfgoPwLEQwS8e88vsAwUzS0quzZ06FNxomJ+Za+jco8H4vRs+9LaeO19dQ0wqfOw1xjto0EIuJ+gRhQ5ZMwAm6oYu0vUH/R+NSkCBq8EUK8rQhr/q6qpDQ7gRL7+Ha/MxraKIywP1Gg4P6Fk6Hp0lQwQ0HH6EFiHt1SbIPqNkN5w7eU6t60cUCAHmsuvXBVHcS66bgR47cBfSEsKv2Uq41yh+zq0tfncO31jP8c5Ti0xwElvNtmWJfOgl4kK4YLnTaroCSfDr1VUsSf68wZ7ri2OutQtAP2PwtS2EL4+D469m7uwh2WZUiX5jsLwzxItsWv7rgwtzxfQ3+NheSJA5EKUWqqd/kF3oUYESxuCOVVh2PL2oCyErQ=</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <response>
    <action id="UpdateSerialNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1BnsQxpm/VSOlWbsJPDCT34PTbIyJ9EyRLibvo5vAulEHng3veCuIYKKdBjJlI0I0WjQGQS5EA+e2minWPmrU9UEzxXuAd7eKmG4MvyGIXNIWTS+voG2owDXPAaIt7vtg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwS/pl+1ET+6pwjYzlQZ7McfyfljsUkhPvN8bxWz8OBwnmYsYBOL79Z8UgphUbryKvKOM3MIsx7jnEWBSCh1hQWjSFsDlfUr13tI2DBfqlKrZHF4MM/p/phAJBxOkWeKIFfD5Eu25sS59r7FNAgRfw6xZP+JZ++j7aS/8XLt+krxY9YFVw7ZbXkxaOlyNnDE4Q==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="Execute">
      <title v="Xử lý$$150" e="Excute$$150"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header  v="Cập nhật khóa mã hóa từ máy chủ" e="Update the proxy's public key"/>
        </menuItem>
        <menuItem commandArgument="20" urlImage="../images/Generate.png">
          <header v="Tạo khóa mã hóa" e="Generate an key pair"/>
        </menuItem>
        <menuItem commandArgument="30" urlImage="../images/Key.png">
          <header v="Cập nhật mật khẩu sử dụng dịch vụ" e="Update Password"/>
        </menuItem>

        <menuItem commandArgument="40" >
          <header v="-" e="-"/>
        </menuItem>

        <menuItem commandArgument="50" >
          <header v="Cập nhật thông tin chữ ký số" e="Update digital certificate"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="--">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>