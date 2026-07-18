<?xml version="1.0" encoding="utf-8"?>

<grid table="hddt01ct" code="stt_rec0" order="stt_rec0, line_nbr0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec0" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr0" type="Int32" isPrimaryKey="true" dataFormatString="###" width="100" align="right">
      <header v="Dòng trên chứng từ gốc" e="Original Line Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="line_nbr1" type="Int32" isPrimaryKey="true" dataFormatString="###" width="100" align="right">
      <header v="Dòng trên chứng từ thay thế" e="Replacement Line Number"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec0"/>
      <field name="line_nbr0"/>
      <field name="line_nbr1"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752CmBzyWz03Q1JxFVvBFHEBUbEhxM5jR8xai1pChatZxafrxg15wC6WttIWBkw9FVANEI3NYc36U7L3j9ZSdtZw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJbLcdLFAf1rUvKSQnIIZNmOU/sfvoaEaRBV0S1qfh/EmXdpFB9IwLAhfWC02V4AM29VFwG2h4IwSnF2tOMimStJ0ZW4y4oFKPlsbCToChcH+cB1sdmzekgXZGLN9mBNIkDde01JaxFyrVnhWKGLwlP1imW6ThrsFzM5Yc16tAKX8vQi/jfSTohutMVlHX+88tRkIy2QN1Sm7PeziMNGy03oGB3u8be5fmoFP/7wvO+Lbfr6JxL50tH9NpKlIeDRcQsxof9E4BFOihUEuIrYibC6lPeEuAHm/SHR5KMoHyY1cbr5fNBEpBbsue8Df5zAAG57gXtD6CG8q6xrU84s011b/bKd3JVr3uHPhBfLytdvorLXwG5JCV3t8+OyFBsf4hG5pTcRkanpPOtJ7ioFzzbHGD82w6a1JINS43gUiRHc9o36JSqPrNaWxe+09cyRqOfXhwd8sSQjItWtOnya9rI2Cs9Kg6INKxOHqfDvmIoWBRmcpv6HiguurEf45DWYYJGFvgkwxDB6mGjJDeksb7oK2IR7fumVi/hTPYTaPQcUv+xuAeiUjC1nZo681bYIuISmY/rlXEx4ZCa8Xt1czhoHE8Ss09c54ZhaAlOPZQhIzpgRhCrtSnOP+Jj4Qj3FGRkysYbpZuPR+N2fC5ziClOIi1mKmPM00ZpzlwtGSrCPB4Go6wF0JzPOQH2h+mXUI1PgIE0CxBkKg0VCeyix3j5CHnf7xns5hG48INCRbOhbQw=</Encrypted>]]>

    </text>
  </script>

  <response>
    <action id="GenerateLineNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVivQK5hGUGsRJ9tjIPsVb+VkvJg3PyOBg5qX4irH9ZDhJ/HGcUeMjejFsTee+7rS95+P1cur+HnkN6nc/gxcz8zpiYb094zVTY5lTE4Pkfa8RQ1OCB98eD9ntDY8mM48gBjy4YtocY8BxJ4meqJeoWcjU+y7AYLX8a0c9zvtGzEhcWDrAgy8iFrk8LHTnho1iRgLoCNB5wgPk4CFvobyZQadTj7wCWUn5N8R0MlNQ58TavEPUCCPlAXMeqSPXwVoE2C8XOhHjW9YNxoFlKJvNQhBzRl9ETaADmD1qxWQXsVJL4PdHhtjtF6h8+jip+6nd86Bw5ylnzQxY49dvO/ac/cTFQdT2RigiKXHn52pV/cIOZaHoJKcMohhVD2CrhTSgCK00R+rnUcjVDhMKssNWJNYiTh2ucp0si1yJe9ynXVg8YNQH2dJBCSTQtQaiAmeC520hAQiZ0FhP1YypmVz5JdHDJ3IXS1seHHr2juB9JqFh5+8n9+qHaiy9ePSW57bQIzQBk1AygLFaR1LhtjMETXB</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwPY4ajEgYv28fASCj/hsaOujUfX5ERQavP7KykWEr22MrxKH0drc762QR8v0YeoyxQVhRjcgTtpnXvNFZsXYKX9kR3TTKYAXu3gifdfzQ9Uma+hcYERYo6cuY+wFLyEGbY3ZvknqlusO37Trll/mBqgaWOLWXR4LJXv+EyWQIjRtYvY6cPZr+L9Tn/p7e3phmtazNOkwv62J+wadCc1zIY=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="GenerateLineNumber">
      <title v="Thêm dòng theo chứng từ gốc$$90" e="Generate Line Number$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>