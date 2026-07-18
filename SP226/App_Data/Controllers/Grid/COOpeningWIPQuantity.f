<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "ky = 0 and nam = @@1 @@0 and (@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY CostingObjectUnit "if exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(val) = '1') and exists(select 1 from options where name = 'm_dtgt_dvcs' and rtrim(val) = '1') select '&amp;' + CHAR(255) + ';and ma_dvcs = ''' + @@unit + '''', nam_bd from dmstt else select '&amp;' + CHAR(255) + ';', nam_bd from dmstt">

  <!ENTITY TransferID "COOpeningWIPQuantity">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjUyjaREWDBhl85d9jFcODE5+WhLRSFytWhiuszhzrG1OpFgxF4wnl5m6CTyU0cpj2+ZRcCJZwgHx6g+4Qvb0uyroVvbyz9T+gLy/dfgsTAjaueHnUcQC27znVygTQgjFIV54qBSpQkdi6c+2acgOssSuMKB7VH8knyceBUdblwhJKZfdmm3uB5Mb7y8tBBzXFnWQHd89xd1Id1KrcFant/YdHX9T/WLJog55S8F8u6zbvqSYg0iUHogrB+LYopZWLVNPyNHXUTv50SMThxVUk4E1WVhCpTv8QGqks7tKEGQ8bWise6XVcYnhgxICUKYeao1ovEjYSGvCcrNIunS8OxrwMrtfdJy8o8LecJc7VNSYcNZ0W4Dn01QsX7OUXsOEXcw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY CostingUnitGridOpening SYSTEM "..\Include\Command\CostingUnitGridOpening.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdloaiytddx" code="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" filter="&FilterCheckAccessUnit;" initialize="&CostingObjectUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity Input"></title>
  <subTitle v="&SubTitleBalance.v;Thêm, sửa, xóa số lượng sản phẩm dở dang đầu kỳ..." e="&SubTitleBalance.e;New, Edit, Delete Opening WIP Quantity..."></subTitle>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="loai_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại yếu tố" e="Factor Type"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="sl_dd_ck0" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl dở dang" e="WIP Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl hoàn thành" e="Finish Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl quy đổi" e="Exchange"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="loai_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="sl_dd_ck0"/>
      <field name="tl_ht"/>
      <field name="sl_dd_ck"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridOpening;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6izXZazWcGQUYk9asQcaP/32pdJLKvII8Ip2R+/3gopJQJFxNUYM+liLusZUDBNJKaXroiOkqSjgbaobtmn4nn+5GTA4+xc9l7zdCP83Vb4qeuvaDYeqaone5eA9X6vGzYu15O+i35KjQiKFJZwwj3EeLkrRgdmSmsJoci17D2+PWlyJKwbv3RknTkj8GsaGSGV8y5bMm0G19WZo+zIkopfPv0fwpo4bEL9gNYM1sAiJpI60uU4qSCvORWW+OEAEt920F2SZ3yNuDMB5RcygKtUQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKUa8fuaH25CnMBCoI1FPuJ9SRtfZ2XvsOWXw0DS/RMb8Uf9TsOh47v/bbHkoiIaK9U=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ7Zk7hAlQKBlbYqE8GWBBawzQRaZQlciOZr9kQ/fur5dX+kQcVYUKFjQ31/lbxpeNzl338oZJRpQHJbP1dxjr7ZqmvXow71H3SC2iSsgdb3VSAbUIqv45KFMISCYzlsAgtyrqWsU92vytKw5swrBBWnjhmV+OMNaEyqs3MOl3Lq8GpZAt1k9dmp9KP6p8lAwmyIJ4taW5FT4w/yY95nNu/55UoVtk65IjfFcyUkQr0gpFhFPkceHYL9MbmZiDwD5dTXtM7QBPmk7uE7myQRUS5PZ3tSkGMnHwQ1tJEljj1pjMfYjfVm3lfWSB33RDCXyBvonkMTY3qDG8Q5RKZeHwegzyBQdukF1Gwxb1fG9HQ4NyCKJz4HeFRVjAiDOiE7OmvOHfXVvPmbcQ2hTTeeYwIN4gz3spFwBGvf+LKPMREt2MDVFhbEzLmjOgpiniPxfjHruWQP0fe8RuIxcgLHbJ5p7A5am5PT91XmSxMPl+VOM0syH2Q5gTaN/sgai5LCb4o48eOGY3f2lP7qAKnXqS3A</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

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
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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