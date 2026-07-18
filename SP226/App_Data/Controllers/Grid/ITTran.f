<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ITTran">
  <!ENTITY Code "PXB">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi117FM2kAGNaLZLXbfe1lsIvTT8TZxxjqb09rqs/uNpz1DYWTpEc8W2kcrUR37La6LSlkong1YX7lOlE0HNR6ir2N+LWjs79iFBuayITcgu6Ie8DJmw5lGfUbPiimwDhjUJgphdYc0VGI9mLzoYNzuqbo7pIt671PgJvbgJN5Xm434FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaVOqM9PBwt248+b8p5zsld4WDJ8r6EF5P0XEghwkBK9t0nC359Q8eCwVK0ZSb1YEh8nAFQxZ8iIbSc9FOL8rFY6+aL78wc/mGIvIvWyfS/YT7ntXm6myFZupp1JbvoX+s27RtSmdWVwS+DuQSWEVFsdERg3QzJeSnoyRYlXs7hOpyuvHr37nhz7BLZktwboQ4I=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;

  <!ENTITY VisibleFieldController "ITGrid">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
]>

<grid table="m85$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PXB" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu xuất điều chuyển" e="Stock Transfer"></title>
  <subTitle v="Cập nhật phiếu xuất điều chuyển: thêm, sửa, xóa..." e="Add, Edit, Delete Stock Transfer..."></subTitle>
  <partition table="c85$000000" prime="m85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã kho xuất" e="Source Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_khon" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã kho nhập" e="Destination Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency"></header>
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
      <field name="ma_kho"/>
      <field name="ma_khon"/>
      <field name="dien_giai"/>
      <field name="t_tien_nt"/>
      <field name="ma_nt"/>

      &EIGridViews;
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&PrintRightGridShowing;&VisibleFieldGridShowing;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYaVTFV132v0MFwohHI7e8aMvfu13efTnzMcRFnsUNpxOXK8o55Y2FuTlc3aB4AHYxW75cQZpyJIhXWfeZVVKpRFfxZRVPKvxEqtnTKjtTOMX</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+TiPKLmGV+DMekbou89U+jT2ukKUz9JGYTUbUAyORz1gEulKiCAU/TSwMe7fBMHU/FLwcx6pukeL4tQJ29zDwOYSscTEPGLqV6p9yVAlT+XrezCCvjPw8dpDX5afsUaoz7hW/+vDkz1yN35j8F3TgP/LW4gZW2WMRLuqJWyuycrukbJZI7w0WkTjo7qedsNpZBd0riTzxLhSHq9R8anTd2sn6rwOAuPA/qfRGMvyVm+h754W+HBIpyO37Ow8kDu12gW76LJsEdioytcIlqA9b1iThyQ90WxbtwLL4+VSVVFf3XXVWatGCbk0sompR8NpDRTcxBFhuUIlk0aVVW8xwQ3K9gtTq3lAxBjaJqzG8Ns/TWOQpnsW08GRWCkmfKKLq40k2Y5t7ZCqvu33//lxbSPKLaVzXQt+erlNLeTQPCyyY59p0TlUgag15+RkB80mL0HKDgJmSuZn8d7eP4cgiMg==</Encrypted>]]>&EIGridExecuteCommandEdit;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K59g2tFxhHYEBi+YDB+o9k9kWZNKhjotx8+Vi2npKMRN5WidMDBjfBR+OGE7Dfzc5fYZLFdDPgfG7H6U0KLagVqrVOB37np8SETXPMDZ2jRULJZbsehrWG8tKOCwO+tL0lSrF3NokYAN+vIDoMXTyg7/lStSnRq4JeCkjuj8RolmgPcr0GF7gcwAwWWiMdiEgx7FwriAd1cD5CJOJHBM0/6GGpqhyT8dj9SQ5z+RoSMiufh3epwY9YvBdE6Lazs8DHwB4olKfCFPUCN+npm7z4l2VAtacooy/jW16e8uQ1EnLAP5NNTieAUg7+n6tuCjF+K/WfiI2x0xuUIysAtSbDA==</Encrypted>]]>
      &DowloadScript;
      &PrintRightScript;
      &EIGridScript;
      &VisibleFieldScript;
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz2I/A6g+oe/OHZBdFWMW3LeQT3ikB7cM0J701wlE8LOxdUfmePDLHGyG2CtrqGH/MHyO5uW6t2o+KQjSwXsHyu062V4btSYAzHc4voMqXqKg</Encrypted>]]>&EIDefault;&EIGridQuery;
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm60NR98r82UM20QWppz0jEPyPfkCt+RjcQQ2irW0EcOZOik0NLdxHC1fisvhR+L70GKbFbpo25tWlM/LfLwuGtTAHMOFSMD8yHoGYF3lw8HW8AKFZcXUewF20HWeL402Pch8YX7BXvAGZDBl48zCItO8</Encrypted>]]>&EIDefault;&EIDefault;&EIDefault;&EIGridQuery;
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