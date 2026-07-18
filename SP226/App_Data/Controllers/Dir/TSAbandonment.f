<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "@ngay_kh1">
  <!ENTITY FieldDate "ngay_kh1">
  <!ENTITY FieldFocus "ngay_kh1">
  <!ENTITY FixedAssetTable "@@table">
  <!ENTITY ExternalKey "">
]>

<dir table="dmcc" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo thôi phân bổ" e="Tool &#38; Supply Abandonment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ngay_kh1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày thôi phân bổ" e="Abandonment Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11: [ngay_kh1].Label, [ngay_kh1]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tObbvzGQgzUFfVk/XjWUWeFIdpYNkYt91CTTFaVHt65ftSn1B/g64rSnGxr+xB0mncSS0TFv6LJ85q+CR3u+sIrY14u6Ca77HlhHS650gqpXNW4kIvEH8mCK4el3sqHYwp</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B7AYzWVPsi1w9Hl8puw8y2ACfPxen45MdcjvkarGFF/QA==</encrypted>]]>
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