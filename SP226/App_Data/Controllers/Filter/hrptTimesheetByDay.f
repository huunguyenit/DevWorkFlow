<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu tổng hợp" e="General Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130, 0, 0, 0"/>
      <item value="11001--1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ten_nh_bp3%l]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp2%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOyqIlGLBI5shuY+1hULJNgWtiTxUN/phCpOuEq8/WfQwHwmQT+onYiHoJ+9ZyPvQgiguLMI/9BzVDPDR9T7B40=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA0tMP6U190MXEEY3azAsfa3pdRLncB6eTNeMKNijWOtblGdU2wFtlAS75E4H2N2cfkMUE910Lbnpjcxv7TWSLQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4q4wHRxEMjdryPRwYhSvsME/HcKASsmgQYV7jJZHVLW7/EOemd+vXtaS2PTTrImk6Tdj8mYEKBGRCJEEeWffB6K9OWob6QJjVp1csOuA4LjVdZPy0HRSUg9Y1Dl+cufGWlhMiKyawA6pB4BHfpMJ0fyZ4LPhIGT7O0iiBZRKoSPAmPvLQNTbE8Y9YJr91GPMG6MxURby/ZB0Rpb2Uh+v0E0cBDJ+kaBaNpvB2IfXl++3wFJloZIGZRCBjZh8UK/a9xYHssPAFkpUp9YxLmWk8K2ho4i1i06vbIEevvLdSibLPwbTPQdn8dwlUOHDC+ehpktJgIoc9hC9cXDmqwl1moOIaCXEAuU+AIcynX1l5IdrzyC8bc6+V40FUzBvxlJ6M0DHem182i4uYMdAgAMD8kz3nU0WRX7VxCd62OqDDCaDvshmMUz7yKR9HX6RL1cvXequb0zb81YyJuXnkdKUpeoUOBBXWO9Zv8bqyzuX3j5ogSWkidMRix25gVMctEVW/OhNqxfSc1GBw9N/hG1uEpmxeUxQlorZotg7Y7nQq4l3D2agJH5cIqfPTeNw3RvYakMfDroAeyLLweal33TuRrShhhhbHCXSgOVEMK0wlNBwj+NSVUmOHKeHgVltgRgFNVWUknonEtusfQLCDeyTFA5RMeBQsH20ZK0upIYVRb5qo6UExD410N9EPj52gqShKkZTNuOVzJERqPswBI8fP8DHbC4lU0pzYoKmuLy1//IojK7QYvCQZLpJ+pFLfDVt3sNCEO4IcHNE2zJqLJYjWgpGVNgyEWsggNobmSwYAUhcMEckasAymyj0vT4NsIAN2bUzInSMNKkXQGbJdsSXvZXHZCh+1YQT8GPxfbb3fZ98D90mDEUU+yXKEOy7LQQWxImQsOhfF6k7MH8SdBYtpq1X89bj4nJWP/el9hEJIYjdMlg5FOKrarBRXl7lXAZ4BkEux7Oloj6jMlYo5Urczg=</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3UUu57XBBEiC/ktUcE0wn2NrIlGluCOPinGkS1RBdzPW45qjj1RaQyLgvT53skjyfiQMALTVlpfjoAzfZUrP6Q6BFgo8rQG+EDDJynSwg6+O0z/Pb98eUYWTyrY+GzQ+EQFDvr/vdmTxUxCS0CvFojxzR12DW7ejcjleExCAweMRO9GNrfFoYJcuam4ZJ9NyltPAKpEt2iB04zsJEBEwUx1DmRTvLf8O9xETJsbdIhbkeMxMzP4uizaTsxZ9ggr7mWCKudnH4gTYyaPFEa9lmiEWMgq3p835jiUgokTpy3lSot/rDMANwMsGQejjX2bhW5sIVD5oZpC8JKJ5ZcgmMSwcBPJcrWaj5ryQcHJU7ku2rKkp+0wtqLuFB6iQ30AYp9BUDamJ+onbVk0Fsbj0d7AbR4GJsF1f5HB2sVmx0Vq0Q/SFQPWNWSirvgs0piJ6oQSc+4jqWSvFS/ukUHIig50X9OV0R9KNmyNlxHfArh1ULeoyJR+Y7Y18AqkLeyF+hkupgnvfgbODD8DjJQ6yb+KhNKGSxyaUxZoj+lAg65HMvSyNCY90P1muGxWPJuUzEjthBpZwamJddDT9byNeAhHRum2M99Xd9zgYa3T1ogIrzMZQHvb6EXHSi42zV++jgwX1flGiWOfZ8ZF1fZrvsuFxxyuxTblNIr16bVTlorX3MeUTZyrDY2g60dn2ySK6miBF8Dcp/S8N4csIDyYyaHlLkRGcj7dC+Op7F6arg2LNa+7LAWzylZaA/oC/17fJAgcGo5Dlqz6WVxhpLFUV9JHqmLfUAdc64aXpiowBXfeDmgmxe2jwrGipZNz6AK+xCmjiEnxxaCii0O48NJDM38mlmb/jXRlutVa1S2UmuQc5jXsWUTYKeHujnbJ5IGqpMutha+qYXwLmwsgFdK5ZQZRCK4xJjGYUnIXZcg9frXr</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>