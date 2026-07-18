<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="loai_duyet">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="SOApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_duyet" onDemand="true">
      <header v="Người duyệt" e="Approving Officer"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="sx_theo" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="1 - Chức năng, 2 - Người duyệt" e="1 - Function, 2 - Approving Officer"></footer>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 40, 40, 100, 100, 130"/>
      <item value="1100---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1100100: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
      <item value="1100100: [nguoi_duyet].Label, [nguoi_duyet], [comment%l]"/>
      <item value="1110000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kjh4UPw2y2275PSRRMJt3UKSc76zLEcsUIFSKZR3EckJE6PLUIfvSEDgsS3sQPRkPqHi7uW0sLA3E8YGTobJe9KyFCqiXsK0D2KfJZ95WCum8MVdL50aiPGssHZbHlzPs+AeQ4jTfGiO1c3czcEfaUc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm483yb1QDuc4BVBvqtcs872Pa3xiAPX5pPSZBYQriUnSbJ6AeL4ngN+jpK+Hw3eklDzKnl8YJsn6QKsSmASQ0bbJ6R2yNYwOpGAqSD+VUP3VghymozaEJVd1bvv4lTO5xdc09f4NcWIokTTU3GE3C1pN++u0jNvbSb7NSFp7yS9q25Xk1/OeBDvo3Xr+n3e5CLrfraNbeLHeVQHcVsxuxvPoruhjQo6f+s30Q7FecKd3e97K6ch3Vt18vzOot41In57yqzlaFjubh0Om1y+e/Nj+mUYwwworjrK+ZFvy1CrBu4RQY5ChMFwxZC9GtulvZcjP+GXPve1X5W4IpNIO7+djrSlNeT+a89iIYBxrszY/MDBruF90MOscVQbjSXXVpzg=</encrypted>]]>
    </text>
  </script>
</dir>