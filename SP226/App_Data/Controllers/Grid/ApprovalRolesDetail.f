<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="dmquyenct" code="loai_duyet, ma_quyen, line_nbr" order="loai_duyet, ma_quyen, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="dmquyenct" prime="dmquyenct" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="status" allowNulls="false" width="100" aliasName="a">
      <header v="Từ trạng thái" e="From Status"></header>
      <items style="AutoComplete" controller="IndicatorUser" reference="status_name%l" key="loai_duyet = '{[$loai_duyet]}' and s_status not in ('0', '2', '5') and status = '1'" check="loai_duyet = '{[$loai_duyet]}' and s_status not in ('0', '2', '5')" information="status$dmttcttg.status_name%l"/>
    </field>
    <field name="status_name%l" readOnly="true" external="true" inactivate="true" width="300" aliasName="b.u_status_name%l">
      <header v="Tên trạng thái" e="Status Name"></header>
    </field>
    <field name="kieu_duyet" width="100" aliasName="a">
      <header v="Kiểu duyệt" e="Category Code"></header>
      <items style="AutoComplete" controller="ApprovalCategory" reference="ten_kieu%l" key="loai_duyet = '{[$loai_duyet]}' and status = '1'" check="loai_duyet = '{[$loai_duyet]}'" information="ma_kieu$dmkieuduyet.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" inactivate="true" width="300" aliasName="e">
      <header v="Tên kiểu duyệt" e="Category Name"></header>
    </field>
    <field name="status2" allowNulls="false" width="100">
      <header v="Trạng thái khi duyệt" e="Status when Approved"></header>
      <items style="AutoComplete" controller="IndicatorUser" reference="status2_name%l" key="loai_duyet = '{[$loai_duyet]}' and s_status &lt;&gt; 0 and status = '1'" check="loai_duyet = '{[$loai_duyet]}' and s_status &lt;&gt; 0" information="status$dmttcttg.status_name%l"/>
    </field>
    <field name="status2_name%l" readOnly="true" external="true" inactivate="true" width="300" aliasName="c.u_status_name%l">
      <header v="Tên trạng thái duyệt" e="Status Name when Approved"></header>
    </field>
    <field name="status0" allowNulls="false" width="100">
      <header v="Trạng thái khi hủy" e="Status when Cancelled"></header>
      <items style="AutoComplete" controller="IndicatorUser" reference="status0_name%l" key="loai_duyet = '{[$loai_duyet]}' and status = '1'" check="loai_duyet = '{[$loai_duyet]}'" information="status$dmttcttg.status_name%l"/>
    </field>
    <field name="status0_name%l" readOnly="true" external="true" inactivate="true" width="300" aliasName="d.u_status_name%l">
      <header v="Tên trạng thái hủy" e="Status Name when Cancelled"></header>
    </field>

    <field name="ma_quyen" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="deny_mail_yn" type="Boolean" width="60">
      <header v="Không nhận thông tin duyệt" e="Not Required to Send Notification"></header>
    </field>
    <field name="notify_mail_yn" type="Boolean" width="60">
      <header v="Gửi thông tin cho người duyệt trước" e="Send Notification to Previous Approver"></header>
    </field>
    <field name="created_mail_yn" type="Boolean" width="60">
      <header v="Gửi thông tin cho người tạo" e="Send Notification to the Owner"></header>
    </field>
    <field name="parallel_yn" type="Boolean" width="60">
      <header v="Duyệt song song" e="Parallel"></header>
    </field>
    <field name="line_nbr" type="Int32" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="status"/>
      <field name="status_name%l"/>
      <field name="kieu_duyet"/>
      <field name="ten_kieu%l"/>
      <field name="status2"/>
      <field name="status2_name%l"/>
      <field name="status0"/>
      <field name="status0_name%l"/>
      <field name="ma_quyen"/>
      <field name="deny_mail_yn"/>
      <field name="notify_mail_yn"/>
      <field name="created_mail_yn"/>
      <field name="parallel_yn"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/i78tusYOHM8A+jYm/tXbR/66Eec5nM4VhqAa8gyABYQaMee5pDU5UnIPaHvD7K1CItapUzoVy09W1oOQSFsO8h6ZovC6ncfCcwgNMPkYmRT6QIN2QoZBlWQDUycH8njJjiwEYNNa7ORfVaG1U9OsFrBGxDyRMHP9BI35N0dbWBHm8SNInNRl0+G1ZAdcDU715syJ/u4aI8sdTgn8s0qLCktxKHiElTspQc8Q9Ggw+FA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>