<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY % DiscountRate SYSTEM "..\Include\DiscountRate.ent">
  %DiscountRate;
  <!ENTITY FileName.ext "ARDetail">
  <!ENTITY FileNameAlias.ext "">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ARTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2f9pE3h4VmviDCBToJG+d1ZiDn8yUmdFSRMicR6vDYrSFastBusiness.Encryption.End&FileName.v.ext;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFOFDbyNI1kAQz6uNRlul6g4von9ter+4L8EsDUljDA9xiDrRAZ5mYIpXUtXrSnjbXPJayfrT5GjWxMw48/6RyZI4OflZa5q3o/vyevi/p0iYGNh6IK5+nFgHX0h1APNxUg==FastBusiness.Encryption.End&FileName.e.ext;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFOFDbyNI1kAQz6uNRlul6g643xlRvxR+fkTXmMxQMLRJdax7IbMCUTYccRlv7Vzf9z2xnGys98/edQXxqeKbBn27flP5+C1UfbNPsBIbAu2OvsYrzjGj8uZeX2Dbe6gIvw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % ImportTax SYSTEM "..\Include\ImportTax.ent">
  %ImportTax;

  <!ENTITY Controller "&TransferID;">

]>

<grid table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HD1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hóa đơn dịch vụ" e="Service Invoice"></title>
  <subTitle v="Cập nhật hóa đơn: thêm, sửa, xóa..." e="New, Edit, Delete Invoice..."></subTitle>
  <partition table="c21$000000" prime="m21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&PrintRightGridShowing; &ImportTaxShowing;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYaSRzJqNGk1Kc67hLp9M1AdLMrrPqMqG+xtRJuqSl1+0NFhTaAtT9taszjv/yl98UW9X/ZrMZf/fnfSY9K1DY+lWS2TWSbwm3UqWf5L8FGSc</Encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NIDuoSPW9f2YCjlltw5lDkiSGiSJt74V8jSLcsWaa74dLRwy42EdPtwEJNco5od+w494Kaf5N06gRpWhLraa/aR4iJKFKgMSFoepGXSDsA+/1hb2aXJ65tX4HTrXmGk02MsaDBcn/HWTF8pHxcoqAi8kV5rOjnt9NdamvoAN7WBBFl7l5EzXcFVLFcqlFxCIA1mHbVKuzr3jfhuFur4sCHcQZzNC/qq782Irmr5lJrjhypsgbhgHYwpnxYRjTTd3xyX2BH3zYODoDlIQgxic4AOs1gYSugWkZ+QcC6x91Ckg=</Encrypted>]]>&ImportTaxDefinedDownload;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cS0S+Cntr/9+qAnw9iyp0RcQzMZpzYRL9q6Ui1g2iWjNTWdm0xuZ6RLgbZJwwldH5p+U8MxAMNlXL6s7QPamVQ=</Encrypted>]]>&EIGridExecuteCommandEdit;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KcBj1GUtJV1EMrxYoNTrfLGwRvAvMBD5f6j6fQlYW/O5eclUeSgjkKtjIe+pYxMh6s9+6trtpXEWh1jqIlyOGSSS5FJMf9oJCZy/NwKjglTvGDvy2Vpf/MLsuTWkKVF2hEtnle6giTYEYtqbBWDDLAeBNIPqfa2rnA4V5ozGqq+euRFi6nu6i8RFddztl4EvSrPuKgZaV/3R/Eck25Xh5okub3b+izJuJqIXfB/L0a0pg48mqwBJZPII04fJLygWZGhIxtZA5Su4Z26T8/TLFLc08stCE/48rU1mA9gWyZY5gjA87VFi6piOJqE62p403vtxwLEue6f8Mp2Pnl9rIKQ==</Encrypted>]]>
      &DowloadScript;
      &PrintRightScript;
      &EIGridScript;
      &ImportTaxScript;
    </text>
  </script>

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

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

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