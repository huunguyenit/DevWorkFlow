<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrTSIssue">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaPGrRbPwSsUH9VQnKK7DAvWVn8SMJyscorg0cCF4WJKyBU1oyy7pkccEWZNttoU59x7ZnwGZuZ2vKblloe4wvvp8ccdFuCVjkk9VcWtcRJQy7JDSdvncaUU0+PFCmKe48=FastBusiness.Encryption.End&amp;FastBusiness.Encryption.Begin$/6DsaM2LHfeX4VBOyUJbin0jkZDm+j1NF44dbV+jHrF4KlunT0jdF7xoYxFEMQAcwhkFYJMFX1VFkTSxBZZxVP7WYCZGbyX3nqvoImMRk1brCCZQTFNxLouablt4Hw2uFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
]>

<grid table="hrcccp" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H05" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Issue"></title>
  <subTitle v="Cập nhật cấp phát công cụ, dụng cụ: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="hricccp" prime="hrcccp" inquiry="hricccp" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYecx0EdkIrv0SaFEy1vHV2uLibm5HDcHlhoT0D8sPuyljK7BDrHtaUuHWuVMABBeYqAiAWaTVhuspH/6AE8GMvbBFr3kH9kV8ZyFFjr24NmC</Encrypted>]]>
        &CommandWhenWhenVoucherBeforeAddNew;
        &CommandWhenWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+dHcHiIvg1oYlQuw69YpGJ3vgZxo3AO2ltT1GuYsBvhpaaJGmK+XF0wj2DzQjfPYvMSkXGv8VRu+v7dFtKmilPuXZP/dF38hSXZrjyeRDGCbhrHtJdL30rX+f6B1dabfBzRb14dwHY/9YYrlWEpJQs3H6Gkg3LPY5az+jFouq+r4QyLP4G2TwCmUQ96DN87SJyUdVsR8iaLNxbRYYbPjWmKW0vcbZjsLbJMTws751m7wqoCNkFQ8ivLOm5gXawYslUu6vJVm8Ya5nr8BUaU+MqfYqE1Ez0rHWiLufdfaGkHYiPYs1N4sMHwNV7ZBdqGcmEsQW7+HpmS9ORp6sxyVEZwitGYcKdhKOiZ2cSskn58Zma0RTZlbDbPb7fytY4NsB/rkoNshoWPmP+1mc4eTW3Uwbl/g/LPWGqx+UCjc1xEvplntSjHsPtRDoTqd1JbQBq2jEP9SOg6Jo+sohj/QbwWw0I2XGB3ErHMJJ5Ou9duA=</Encrypted>]]>
      &DowloadScript;
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz2RifMt3YhehDmKvnozGsFmbQIbAJWWjuFMlWAwA/CBDQZdL9yrEhDiRSFFo1MwlMurZFSbKPHrhbPNOySzRQkn+6tWodJgRx0RB2zoGe/Qo</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm60pKcPn9Uade72swROywI8WKsMSemuBV3SRnz+ovwNJrAgvWddGcipooZYVatopO6a2cLV3YzQMnvF3YqsJ4RRiYm36nyhzzeVS7WSRnKUtdNx0JcrBmaOKYCBaIerEz+s=</Encrypted>]]>
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