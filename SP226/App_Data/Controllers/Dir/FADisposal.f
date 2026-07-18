<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "@ngay_giam">
  <!ENTITY FieldDate "ngay_giam">
  <!ENTITY FieldFocus "ngay_giam">
  <!ENTITY FixedAssetTable "@@table">
  <!ENTITY ExternalKey "">
]>

<dir table="dmts" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo giảm TSCĐ" e="Fixed Asset Disposal"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_giam_ts">
      <header v="Mã giảm" e="Disposal Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts = '2'" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày giảm tài sản" e="Disposal Date"></header>
    </field>
    <field name="so_ct_giam" align="right" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ly_do_giam" >
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [ma_giam_ts].Label, [ma_giam_ts],[ten_tg_ts%l]"/>
      <item value="11: [ngay_giam].Label, [ngay_giam]"/>
      <item value="11: [so_ct_giam].Label, [so_ct_giam]"/>
      <item value="110: [ly_do_giam].Label, [ly_do_giam]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tObbvzGQgzUFfVk/XjWUWeFBHgI6FUIT9Q91m01C6sgYKE0Qn5zYYemFtG1DFzm0TQQtlKpr0+BsdT7NAf9t9aHaEpEQ0kG5QBtDf+aYc+lmk2u4FQ4WsVGj+wh6BEu7aX</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemzdUd7aU/79lqGl5ZH06FntsXvrQCjvI5u3dTqPuNl3</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>