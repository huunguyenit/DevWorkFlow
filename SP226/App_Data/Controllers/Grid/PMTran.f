<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % BaseCurrency SYSTEM "..\Include\BaseCurrency.ent">
  %BaseCurrency;
  <!ENTITY FileName.ext "PMMaster">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "PMTran">
  <!ENTITY Code "PNB">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenBWC+1mwEVXgYGVa9x+U9OlsLVGrDhekg4ciaiK9ZCzvCIdwjz2pvUrEEl79lh5QqiYGkLrhtYezsvNc//pJgOFastBusiness.Encryption.End&FileName.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Tf7nXqfgg9rbRV4lIhLKP5IfJrelRlHu1gSz03lNsL4/1s3Ar2jRHU70ek6YlQwhT2VcWo3CZ/f9pKPeFSwJhT3JHw6yXuk7Ahz7ixlvOEwlXDpMxHfYLUw4GOVlvpp+r2bCuyJLC4XVcAUcrxb3DobUzUaXWshqtiqOepKcNZ0FastBusiness.Encryption.End&FileName.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Tf7nXqfgg9rbRV4lIhLKP7O56u5ScodzWiMCbmET/wHYR7ELmzhxjrcdols++3lmxMpevhKLrd7da5vdsCUAHM=FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaWj9jnBStznXsgs/ifjDSZ8aH0Qhck+XIlZqWZhej37PQ==FastBusiness.Encryption.End&FileName.Compact.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3dzPMiuASKM3FaWx9fZtaSa9DfHC1I8Hi3UV2KT5aZAaIfUBv7BwzDuiXKnHuqFpDBOU2LAh+dDppoVTWLw0IXrxtUK80IyQk9UqMBnjyqs+FastBusiness.Encryption.End&FileName.Location.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Location.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3dzPMiuASKM3FaWx9fZtaSZAodbGg0FpCpkLpUfCDirnrF2WsAgG4zrRnEjmJxiF/WQL1rNTM7PtPDJ0CNg+RzwyQJCkV88wXXsLiKOjcE8IFastBusiness.Encryption.End&FileName.Lot.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Lot.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3dzPMiuASKM3FaWx9fZtaSb0vKcmftb9EVd0AJP7yXQI4WZdInjxuU7D5WA9gU359KWZiG3DJQhnl6V6vgIghQKK2mqwJBFwAU7VsJlBKS5XFastBusiness.Encryption.End&FileName.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3b972mV9YT0see7+HYqS8iiTjHHK2gqW6VtYqCghdJWuVugWCePBUmDAZ+ZWkF5xPj/7H50WZBJBZ2F+1NtKwF/8zwpXwhvsBM//ICHRhzx8FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
]>

<grid table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PNB" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hóa đơn mua hàng nhập khẩu" e="Import Purchase Invoice"></title>
  <subTitle v="Cập nhật hóa đơn mua hàng nhập khẩu: thêm, sửa, xóa..." e="Add, Edit, Delete Import Purchase Invoice..."></subTitle>
  <partition table="c72$000000" prime="m72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" aliasName="a" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    &XMLWhenGridShowingPrintRight;

    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYQV4N3OPU6tZXiBYqZllWDrfQWW3hVDje5jXUrqeUN5+KWotjXvlpoC2HmpKDz5RrHQELLwAM+fkelbi2CTd9tFco0WcR97O4L1ekf1QtwRz</Encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXJELVKliErwKNMSXmjLtBUyUk3sHRAxrsG7BbeDbvlEOiSz5gOOjYdX39y/tMjLHc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+WcAz1ZYOxs9BpR9U9hhBxk0Kkrc4OBo5Vmcya8gvH1v+x606HEwwC/GazQ+Binqp3gUMSAw/4RSMFikfEAuGdTvyw8cpST1hmI78ghVEbcohiiCsAu7hV/RhL+lTVCBtoU17nL9OUPp4YfxU/zdrEtV7YpIGRtLuD6Sm+CLFGKL/inEW2zWgZf1QnuYYFkAAR1MzB0P+r4o/feNwkVxTcWzpdLrKwulBP16thHrucsYiviQ1M6aRjBrAavk4ADUrpa9zaxpnkrn4GnlgP0+xH3g7AJpqd5gV2mB4qMlk94iwljmxvKyLSeAqdhSrGVKa6uybjyxDVRUsCmytlN9zFeelVR/d6hDxg0AMZ7En7AnQqMkNdK/S5/gdHerDndjyRlcMqpsGq71puJoRKz20IfQdp3lCHoIweBqGeUwITLr/ytnZcyLjVIGAybqzhCrbstlXLkowH2ToPCKhGKmDxIUhF7VKdf4wuUgZpPKVnFkMwMf3MYKCZ6xFxR+I2bJ2</Encrypted>]]>
      &DowloadScript;
      &PrintRightScript;
      &FlowMultiScript;
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5aBtgdl2xl7+PBnmNVcCN+zRK0sHzn1BmigUWPGjYxpRtD3ZWP+SmNWzYiIsLJGJI1QTq3km0i+fRoyBLp2Uo+wBjQfo4Dt8PXyhEjzXT3RM=</Encrypted>]]>
      </text>
    </query>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm61XDnb9bLYLD3vyQrAR2ODUTOh4DsGJQJOO5ICLr4GAi79FwXppym6PfaJ9ZO7sGGjEHFoAj0aLU8odkG86oRj/E+pHD5tM14X57ctVotrbBraC0Ss97nAm/5oYcgk2fwjRtUDOqaaZtAfpVY3seKUXbfxwDSPfCeA/7B5KXnXAM5poGkt20DN2geCdtHWgCqU=</Encrypted>]]>
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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>