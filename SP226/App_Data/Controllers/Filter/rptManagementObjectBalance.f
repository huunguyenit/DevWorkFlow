<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY Controller "rptManagementObjectBalance">
  <!ENTITY % ManagementObjectReport "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    &ManagementObjectTypeField;

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"/>
    </field>

    <field name="tk" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    &ManagementObjectFields;

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      &ManagementObjectTypeView;

      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>

      &ManagementObjectViews;

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterShowingManagementObject;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        &ManagementObjectQuerySubTitle;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnzBTZWbVQtaaaGqIFDfCVJdH4PHp/2BoLXe26PXrbxXzf6uuG7kb0btllqka/+GQro9MpoOeOHebhvDt9FJ9byKrAye8gcwNPq/UcmoPORlJwoi29e9mMJJHo91tmOaVFpUzfzLznL6MUbeuVMOyvTzPNxgO1M+OW8trnQnSRDhPyb6B5uZrGsNinyxOq9lVpBheZgvRDN9gXceqsxX03I1AF2gofgG4l5zlfc32MFg4WEgor8RpSr23ap+uUuDrr</Encrypted>]]>&ManagementObjectQuerySelect;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj5RYfblb5nUJmVG+uZbLsu3jg/vvm3X+BMMecEP4KpU5VNlvxV6t+jtF11SFYDnP+06jL8r64BS2vvFDpXToicAa91lbVVJG2/8w2B7VeHsLN5IMykqCTgXxGHGCMaBd2y91JtKxn4hCP3qcOC85Qk4=</Encrypted>]]>&ManagementObjectScriptActive;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/N3rJENt/puefWnxCAsLHoUrOpupdqz+1spE19aT+H47AbmtookCIPReUZEO8EFS0aYLqFkkMVt2ZB8slPgZdTLBCGCbzLrccsbWdSzYmts7UOCLTr+nGxTGrfaxveQpqePbgwmWrCkPCl+ZewkuWgS3LJ8pimVqAeUDZEqRXsW0PYZeV3pEKSgU5CLEc+x7AyhmT36cxjjlDQAlJTJTme7PwGMcdViCLRjFx4e6EIpsQqZS561f9F9tuiz4dSOaSlF3szwN1aH/F9hd+UknfQDABKjKnl1uIPZLesMpsTrSAyqRB77n5xedKgY1hTVxnyPm3hzscc2ktHY7JXq6Lf2OTossmwA4vJ3lXGyPjmhqWnpEme+7Cq+9P0Lm7FJnoLvlanTLVLIyEmcIZkXapV7xmlgLP5ka/3k/Tny6t9WzSST5XiRWK2eKm9Q7jWj/uQgfKQHEI2ZbGbGXRP9oQ6S15TqBZTXz4+0oVN1xxUiMAXyBaqJEe1fI+lishaqpy82biEp7wiEJG9AVxxoa4Hmp28o7jqyuLaNeZcPPFirOQ0i6WeHHAuwEhxObAzqDRop9zmb52pH+dJ7e8EIt1dBkL1kETJPpxknYlquWdJar/fvxyOLSs1ZcocP80xR5E1R3HteVISBH1r5NkI9lPbodVG4OGYFaVl8EDZWM6YkCxUvHdRCWiUiQfrtTotsIL/1eFaGr/DCMVP/pFeIpNNmv4o55J+VhlXFzHzi4ctJk=</Encrypted>]]>
      &ManagementObjectScript;
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEY8qZjOCLprjK7PmVPNZjFGXrsNfvsS1Gf3Uq3BQdc8VU=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;

</dir>