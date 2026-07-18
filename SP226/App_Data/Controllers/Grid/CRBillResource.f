<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CRBillResource">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ4X6DSABFHGmo00b/xW8sESPPXPRjEWPLM9kNmK6nyHu6s0PjCVtJtF6z4arFP+wMcplKK28E6AhYOaA44YZDCqPwIKskxELDfnN1NpVcvsdcASUejDg+0k4VhgauHlNbYuKiCrv1GNyGLP2wyGvoSNacFxn9IeJBwx3oAnqB1XO17NmdLG1kyGtIkskPgbGEF1ERzRC/lMCwIDz8nM4TGFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Product;
  %Control.Unit.Ignore;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="phnl" code="stt_rec" order="ma_sp" type="Voucher" id="CR1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Định mức sử dụng nguồn lực" e="Bill of Resource"></title>
  <subTitle v="Cập nhật định mức sử dụng nguồn lực: thêm, sửa, xóa..." e="Add New, Edit, Delete Bill of Resource..."></subTitle>
  <partition table="phnl" prime="phnl" inquiry="inl" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" clientDefault="Default" defaultValue="''" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên sản phẩm" e="Product Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dvt" width="50" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_sp"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYZVVZsccRkMyQSTzgUVisANrpyoAGPZ3/vTObMhaL3teuZpq740QYCQZIQCEXbQW2t7lutiMHgltx/yGAklSctBFgnYQFNazguuFv74L2kKp</Encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+YvUhF5daW7b+TAXY6vIZeZoDymf2A/Adfydit/6SvlBt09lV5ZuR+spyQv2v3T8By9sLO3vXaOFNROZn1q34R0Ve7YLLkPnUAwlDfuFCQDDw2vB71wqqJWedJYqnF3FP8u3ywPwvnHv7r/2c818bameWDHki+4ixl01wWV3axoBAOrr9C+Qs8tJArqiY9FPx1KacM0tyZ9dbJDnST4gM+W3S8/+ZhhNZsWTmaiRA4japPB7nMV9pvcPseNE+vOdH+V5Kcq4VoGzU39Q6Riw/rGLs4wsvLKKUfW0/T7/SFEJL6ftVP91gM20Ii6UJQYOC5HO3Hgzcl2O3HZwySOcySiGt2DzccjokQPVkfRru5edsuECa0IMwF3qG2DylQtLL/Vwak3n/hkv35LoyRJW8MDrcHulOG0UCnDWPriG+nDj7wJ1d3lyYg3+IiXfIbBuwUhjcaTNdCgf2XoCcXWdNVZGX/LSfzgiLeF95dHC+Ivo=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        &Conditional.Control.Unit.Product.Query;
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+x2nS9ge74ui3KuefVaaWmeJcnbKQMmv0K6/Mhm9BS9w8PLJ3Se3soUdz402YYQrEUWODS4CGpwFay85/zLGUzE=</Encrypted>]]>&Conditional.Control.Unit.Product.Source;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPgQdnbgxSpujs8svHbfF3qR2jTiUt15LAi13/vVg7yI</Encrypted>]]>&Conditional.Control.Unit.Product.Alias;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00RpmQ9I6HjIsLf2HaeD04qsWWsXy9F+2ktfEiW7Rm4K/i0lrEDf7j55rRfAv5IDpFnk6gGGuOQO4CpyalpVIdfNXuorJvDLf1xZ34xF0i2puqTn2H22W2ZSU0yk69q8/UMC1fKqvU+KabwMfESzfv17ZXnpRIK5imV0BMjSWLCPaF1X6iRrDHmY53ZmJwQmIMWhdHh29KN01IV2qsuQxKku5SxqkJdoOBcEDKn92J0cg=</Encrypted>]]>&Conditional.Control.Unit.Product.Parameters;&Conditional.Control.Unit.Product.Variable;
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssRnq9m+Yg+ZVIAkTEZCcTnRdbJcEN1Yk6IKN1GV29+NECWQi28XuJPDBAafzN2MWRl30Dbe6jP6XCCGHAHCmDNQY/czg6USozB6aORQcDLqnHgunAwjtzGZAXsPT4eztuzzPF0th+DACVFmrfSxM4GoDlBM3SFmIVt8dsReB9iT/ts57Wckl8kSJPVRFkHI5k7fRNmnULt/VstVW9jhGVfN6E5W9W/kWbVvn7xRp5f4V5QBCt3Zs0VK0p55FJrTB6M+RBtmAyrQj0Ivom4RiWYWt3ep5S/1wNuwo7QIC8DP+89BTX+/J7lDf33YElH6xMgXd6JKZMM79SnPcGDcGGz8cu1MzdTS9b0fdLeBI0zKpQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>