<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">
]>

<grid table="hrdtyc" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H07" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu yêu cầu đào tạo" e="Training Request Form"></title>
  <subTitle v="Cập nhật yêu cầu đào tạo: thêm, sửa, xóa..." e="Add, Edit, Delete Training Request Form..."></subTitle>
  <partition table="hridtyc" prime="hrdtyc" inquiry="hridtyc" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày yêu cầu" e="Request Date"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số yêu cầu" e="Request No."></header>
    </field>
    <field name="ma_bp" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Nội dung" e="Content"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenWhenVoucherBeforeInit;
        &CommandWhenWhenVoucherBeforeAddNew;
        &CommandWhenWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE/FNzkMMFWOO6YZlsa4Cy6tfduMps6qyf/jP8/2P4uN+lVKSme9gDgUlkdPE76zbawphp+EXSEg+MdIB+RLGO/C50DYzg92vn4y3f8KrATVrbR0rt1knf08P1jeue4i+txsXJjDHIhxDimDnPR0+314iAowogd9BPa9cVeK5qXltsIxiJw+EfSjoluBTwMrIIhQe/gzHMPzk6Xk1ggJN2efrBGVyhu59nBsWcdhfCoso0CVXkDWwNwXnJFA9qgiKRlL6m5sooXGH5NeqvVRWccg=</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE/FNzkMMFWOO6YZlsa4Cy6vpe3NhyfUtvd5LNSCLePSjPqlf9qCdK/E5LwK5ZyEacv8gxInDsheveacEUvDqd3paOB2UBjZFxfAYI1JIzjDAn0S1GT+lK5QS4GskiqJ3aUUx6svoV/BoQwem3+sO+7640exitH+RCN1PgF1OtfQlXsEyKXuVnd+Vj7B1F1ezC4dDKLKgwBQwi2qLolDCnhfa+rkte6Rr62s3hcyTJ4eeQpXJxAFqBpvkW2P2z44mn/K9q3tTD6F95v/RZtC0wRHrZc8dBQhmR/3UvOnauE5sCdlKmOWpPnezEgBHvzBd7ca55utsVhBlPZMLXM6m+ppB8czN+O/B+Z1gk7CPWS5cS0pRSlFGOeUkas1y7vd/1g==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardVoucherToolbar;
</grid>