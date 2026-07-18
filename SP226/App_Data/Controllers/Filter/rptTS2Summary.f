<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1" categoryIndex="1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2" categoryIndex="1">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3" categoryIndex="1">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="dRptOpt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="100" categoryIndex="9">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="rptTS2SummaryFilter" row="1"/>
    </field>
    <field name="sRptOpt" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161" anchor="5">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>

      <item value="111000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="111000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="111000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11: [dRptOpt], [sRptOpt]"/>

      <categories>
        <category index="1" columns="120, 100, 100, 100, 130" anchor="5">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="569, 0" anchor="1">
          <header v="Thứ tự sắp xếp" e="Order"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TkNl+Yk8p/fu+QW8/rB88UC9H2wWwF2oUeoE3pfXMsbxYEteJszMdocl2PebV17j4pWMu2Z4ZF2LIQpN6TASmG86hexNcWi/EAxhepPopollKYbmDGi7WgOiRVF8bvKIj0cOYQo4Sf90MfsajnWFu6utemsRoUmYzLsb2o/yEWDYTXpRWO7Jy5veDAOpKGn1WfwMR9hIeuafrbQqGGOgJo2vHSQJ0WCVB8tgNANsH8t1l4cmIkQKa7fr0UucXnv/XTgJwM0Vd7a0kL17TrztEtJNFlxpdJ2R5meC8cSwPw3dj3zPHXcgke7thG+sVzzp2UBL3ccUTmL3N+iUFKRB054jn9tkYa2yVs09YmwAT1FmKn7vwhIjODU5Ci+rhzq6JZsEVAkT2lUtda8o8g+uhtvXvEOlj3wjiwNSLTAhrOJ6zO8SjLR5f7AjFArKCYuuf8=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&WPtHMc/lwMkgyh0YDcT6A6HJvd9+uJ8hZbXUSQRSTNT3fvGHzCBEIlKMgKSeN08D</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2eIBemYg3DM6k53Q7XkpN7LH1qsFaGf2C/bJq25yOVcofs7tnAUnFsK7z9F0AVvGpoRxjKediImfAI0B96EAkYj/c2DSG+Jr0BP3iiiG/j9/LaUcVYJ4IwKantGSeWp19jar8RJhABZJ30euxZmym5TnQIXplv8gVapLV65cNdyIIihRmMbmtQQvg2gDp7W5sw5Kr5iBSsDQria4zCs7bP/ghbtgQPGaQ0mBTX271c69xzvS16r65/vLdzs1Y56PpkGFH4viXb0THJOK7PXQfA7I0x/JFZHHxeeBIZb9LDEM94BjvjM+7RJMZ3o/+yuX/vCNeqL+PamRDUg1ykjWzEZ7O2Kkw9GxQ63LJpW6vq520AQRkTX6tnVbsrzWw5YxRB+ek93EozsQRu9ELu4Oosw6PU10VMupgddwK389nf7dqP4YBSGju9Hz+1p/4v2q8kSreZf7UIxZw0iBA/z/eOYEIbxO2ldCIJuxM7iQpO5JEOgmbHoIZautMX61oVtbmgGT3Vuy8bU+AOCy5dwhlddGbCLxjT9UdFSWr38b2S15uj5ofgDcy9MHwZtLfO/A7+34vVbYcQv2aC/uIxsDsX+AbsdknNDWdtJF4BtgB1BSmLRjY6gvkSZ37oADxEfyZ1JSmpqvLoC4T4jqI7OoVJ6GF494K1twIukbdDk5172PYYckEXFyde4zXT3mPV2Ud4U+dhBx6zbIqYuZ36+cCmhTxp1zUPF8lBS0ZBN8K7cACubY2gaNXjiwskRvugPtqiJ9q3FcGrn+Bq9jSpFujUKVei9QV6xFTZZTsLyJ0AsXKqLkQWIRkWCgFQLg1NeV3tcIXKzrpKVwsG6B/Nt5F7EoL4+vqZ75rqGtpytUWV7sY4f8tFoDfLyVlRp5R7HzTuBpShLrfOjcsFDNcnqMMCon9KTHOVlxLU+8oveQWufZd+90a8X2SQrGHpFQzZvuGkR2ceqPbtK68KZh1z2Mf9UHcJTkze+eTQndGCC8gKyqAmpgr++kmDrmylN29ova5dW0qiidJVVtqY9jOYVKRE5W+nx5ojoLcW9ibrtPWfHEaZzS1vzI5ndsIVeevH3Zsjx2Uig6b8FYjeZAkG9av+9Q/cti74OP3AZktWNf3ysE4nF5Nya/0wx50cBmA2/0hFvGbtsrm4LPo29RtF5wpyo33BNGJRr6USQm3e+gST+eQfdPJLSoj3T9qii/nW5VSpmw7IPjSpDI0SfwBtD84oB02Oe76Vu6dvEvbRRSdi4zRvrgcvbsRRNX3TzLoavBGcKTSx3MmQZXZOYKF3+pHQJfaX68+VjrPTFYVmr4lRZENmEpM7nScZhlVvBENzeSgWeOp3xzcy1ILB+hKHM4GIyC15yXp/SgK9sNo0Yxl1Q8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>