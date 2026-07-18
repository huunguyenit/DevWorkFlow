<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "PXTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbYprNalFD5gf4FqtZdCs537iusL4HqhA17T9NEfl1nJO+vP0XphMpCUpt/lg2egisNkbg2DkIVUFikPQIcXnKF3DSEvFL0csP/i43ZvulHPPMBBt4hXhCvqR9/gpw+7g82qrAgnpi5TqlY3xa7G4p6GW16tDTbu1Ao/0f9Cmuuq80pG5xmMRVqPmM0clHDGOLFEBbU9T2/eUvIHDfN+yZhgpYzvbyXdUwro2QmFh/s1w==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m26$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PXD" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hóa đơn dịch vụ trả lại nhà cung cấp" e="Service Return to Supplier"></title>
  <subTitle v="Cập nhật hóa đơn dịch vụ trả lại nhà cung cấp: thêm, sửa, xóa..." e="Add, Edit, Delete Service Return to Supplier..."></subTitle>
  <partition table="m26$000000" prime="m26$000000" inquiry="i26$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aliasName="a" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    &EIGridFields;
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

      &EIGridViews;
    </view>
  </views>

  <commands>
    &XMLWhenGridShowingPrintRight;

    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYXBAOd0wRoxthFnQwxZgUUkuTXtfR+VoViSX4bJpMXfUCqvTZPzGFVLeK4aUm26gVC+mIRsqbfsuh6r1EAhFRo8//wEH6ec5dwDYIxTviA7b</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7Nl5feJ6P4i9rR4DG2Sikw6R43f0tzkygdcYbb9ckcqD6OrE+bqrtG4UnbPSrIAYB6uqQ0eApQ2JBXab8aPNQ41MrkTddcn1YoJIeP28qppk6bXKx2sljxiw7va/4+nV9L5ULPUWxgAEHcqVz5zqvEAUhTVpe8bRjpOm1ZS1iEtyFm+e1ZthmBpFNMvYRDyc2GCJ8P7bbun+nFs7MggJDJdqs852ORKUljit33eNwlrnjLx5ghOSjW/Fo3HEqHUW3tVllOaj1mh//b6hLE0+ebh7pgqUR25FLzQy7ZIJqqBXX0ziB0hJ9Yk7eAQqj1ZSBW6NpLX1PznVCyoDcHpCYMHQ==</Encrypted>]]>&EIGridExecuteCommandEdit;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KxUDBR5RKLZC8R6on/ZVt5QRREXUf2HOp4RotKJ19FLNmsXur2qVGO+CeuJvmnAizlmYEPJyxiTeCa+E44R0vNnyHbYHb31wGo1Jhh0BhUzdRn2ezvCPuAHnLOt5qqryMjUgAlrCe6KcmlBKV6GOWABumE5mRND/2SJandOyueFyeFQ4JwAAyjG/xgrARLmqTROMBY123wgDaeUsEGu5GhZckmT1IU2kJ6yNBps5sowW3VGyu7wz1MdCfW3gAM79+Lf7PzA4/h1StCdGg5bjnKzB7Uk0f7WGfvvwpuA8fyoo3C5Ln25DuzI/N9Sjk8+LVaN+ADEXUfMJuiTGzxIasiA==</Encrypted>]]>
      &DowloadScript;
      &PrintRightScript;
      &EIGridScript;
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5aBtgdl2xl7+PBnmNVcCN+zRK0sHzn1BmigUWPGjYxpRtD3ZWP+SmNWzYiIsLJGJI1QTq3km0i+fRoyBLp2Uo+wBjQfo4Dt8PXyhEjzXT3RM=</Encrypted>]]>&EIDefault;&EIGridQuery;
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm61XDnb9bLYLD3vyQrAR2ODUTOh4DsGJQJOO5ICLr4GAi79FwXppym6PfaJ9ZO7sGGjEHFoAj0aLU8odkG86oRj/E+pHD5tM14X57ctVotrbBraC0Ss97nAm/5oYcgk2fwjRtUDOqaaZtAfpVY3seKUXbfxwDSPfCeA/7B5KXnXAM5poGkt20DN2geCdtHWgCqU=</Encrypted>]]>&EIDefault;&EIDefault;&EIDefault;&EIGridQuery;
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