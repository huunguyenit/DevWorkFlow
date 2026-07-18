<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "PSTran">
  <!ENTITY Code "PXC">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi1146Vh/L9ssWOnKz4nizkjYpkgR+/0yIWoDVfloO4YnJPxyv3vQG/9MB253tYHYQa+5ZBZ6sQfW9S6TWDjOAYHqp5KOYEO3apNDMY6XeBegM3p4uIaTYvOv15MrQu9OGjlzubNZNbYvw4Kujr5aHYvPeyieSDV0ISFrLw0tyJBdPOmyu5QeN3Y5b41UMjEG+IUA==FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaXP05zId/KbPny10uMn/kjWit4AfbstDk6sYujpvCudMs6JNuT0ZqkxgjcY1MXyb2+Bov+w/QqcfPXkLVkDLNRwhUi2LeU010GAJVZQgKSEnTa2mYzfcBW7MBk1xc3anCX7wb7J3kYLK7ZPn+ZTBPtYLGdrw4ae8HPsECVlfJOVsNKndK1IWcdrs1LrsTknrTU=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
]>

<grid table="m86$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PXC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu xuất trả lại nhà cung cấp" e="Return to Supplier"></title>
  <subTitle v="Cập nhật phiếu xuất trả lại nhà cung cấp: thêm, sửa, xóa..." e="Add, Edit, Delete Return to Supplier..."></subTitle>
  <partition table="c86$000000" prime="m86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYVmAlZmRulW08IKsmLZb6sluK5sV9Og4fkkdpHX48RPH</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd891aUPYKKs8RAqWIp6sZTsscw7caDfM0n8FmJLsR6sC</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+HV2KOM9G8PG1YdY5Egafpo+h+4DZLXG+aVZI6yuZye+Tek0G9cd6CP7iQyZaWVJPULsiHFi9b/tV5qfBoX75ubj8vS80fU6+i5XlFc6aVh8K62QRQQ4mMtEWuVslyKquaDS/JBzhgCCfLHvguzwwGSwkzqVIX1Rl2BXBovB9IFeBRqHiharVBiz6UhoExcpaGr5oYiiERlI0yuynbgICxPKFWTrcrV7BIkOlqo8XppltMiyq2KZBo0M3OKACtSjX9u1ibuSexz0JXk58Fyjx/edEzn2ihrQKVQNsZRiyA/P9zKoRFOVyChFw8eMCzaXHdGqr+GiVVAiTbe1nX291aw==</Encrypted>]]>&EIGridExecuteCommandEdit;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KK65Be/fvifPYKF7jdlb0SVWFz3tyjyeFJGJAa5I/288qa1E5iUJnf8kb81Fj25sTNGB0YLqZN4ihk9x5hve+E/smXZXCrWWRnKxPjeHO5pWcwyWQxK1Qn3NOGOmiYXzZawS0hXx5NLJZC3Gk2ikut6LKv4/2hE08wOp4z63aX0Q1HlS2EBB5nPQAoio2+QWjN5IcbyOZ6Zm15WdU5KXmEMyz3vDNaVAWTW48FKgDyIwbrIqW+KLosPkmKZVtJx4bzK5gUUQ3Eo9+TYVhFCy5FRKA9CzPxKxOjoEuan+J/t5l4vYlA7B/Za/ylOeZ8z0y+L0ezCt61Ie5p8fCIfhu0Q==</Encrypted>]]>
      &DowloadScript;
      &PrintRightScript;
      &EIGridScript;
      &FlowMultiScript;
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