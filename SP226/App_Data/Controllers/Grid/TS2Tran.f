<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY StandardListScript SYSTEM "..\Include\Javascript\StandardListScript.txt">
  <!ENTITY StandardCssImport SYSTEM "..\Include\XML\StandardCssImport.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "TS2Tran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbJM66KG4spbxmkmlWhvtRAth5OJsceOcyqHijrMCfmFDMyXeJSMJeCVDIOxjqDYN6MkAzxfSRGUgoK4kywHsBFswr1FS2PDK+nxqhvAyCdpA==FastBusiness.Encryption.End&amp;FastBusiness.Encryption.Begin$/6DsaM2LHfeX4VBOyUJbih9gFrPYPDa2geD+bEqr5K1sl2+qWVZ620Jd+YOcsGKWppBGZBHHCc6nN3bXmBmpig++hDG1xxclznxYbcVCPjmhsqBpsZhYvJ1RaA6g5/6MFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="dmccdc" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="CC2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông tin công cụ dụng cụ" e="Tool &#38; Supply Information"></title>
  <subTitle v="Cập nhật thông tin CCDC: thêm, sửa, xóa..." e="Add New, Edit, Delete Tool &#38; Supply Information..."></subTitle>
  <partition table="idmdc" prime="dmccdc" inquiry="idmdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_dc" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã công cụ" e="Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_dc" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên công cụ" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Giá trị đã phân bổ" e="Accumulated Alloc."></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Giá trị còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridVoucherAllowFilter;">
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
      <field name="ma_dc"/>
      <field name="ten_dc"/>
      <field name="t_nguyen_gia_nt"/>
      <field name="t_gt_da_pb_nt"/>
      <field name="t_gt_cl_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYVmAlZmRulW08IKsmLZb6sluK5sV9Og4fkkdpHX48RPH</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd9bavzosm37UPADntJRdrTQ=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuk/RiMrmCHFblOWtOw0wDWg=</Encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &StandardListScript;
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz2RifMt3YhehDmKvnozGsFmbQIbAJWWjuFMlWAwA/CBDQZdL9yrEhDiRSFFo1MwlMurZFSbKPHrhbPNOySzRQkn+6tWodJgRx0RB2zoGe/Qo</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm63UbmsSW+PkO4SIwWXdImcVpkTbTq2fARhuQgBLzNTgWG0VvGnavCnDP/hYqfEigbmOCRt/UlB6bKJOKpzZd+IzZqEL1xoxFcRKdn9eyN4maCF1u9I+XrdjxAjafkORJpIpHRHAZnHiO7Ni2jKolWH7</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      &StandardCssImport;
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