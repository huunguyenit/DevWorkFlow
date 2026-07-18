<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="do_tuoi" type="Int16" dataFormatString="#0" clientDefault="22" allowNulls="false">
      <header v ="Độ tuổi nhỏ nhất" e ="Min Age"/>
      <items style="Numeric"></items>
    </field>
    <field name="khoang_cach" type="Int16" dataFormatString="#0" clientDefault="3" allowNulls="false">
      <header v ="Khoảng cách tuổi" e ="Age Range"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_tthn">
      <header v="Tình trạng hôn nhân" e="Marital Status"></header>
      <items style="AutoComplete" controller="hrMaritalStatus" reference="ten_tthn%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tthn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
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

    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ttnv" onDemand="true">
      <header v="Tình trạng nhân viên" e="Employee Status"></header>
      <items style="Lookup" controller="hrEmployeeStatus" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="tt_nv" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Loại" e="Type"/>
      <footer v="1 - Chính thức, 2 - Thử việc, * - Cả hai" e="1 - Permanent, 2 - Probationary, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="282">
      <item value="120, 30, 70, 100, 100, 130, 0, 0, 0"/>
      <item value="110: [ngay_bc].Label, [ngay_bc], [ngay_bc]"/>
      <item value="11: [do_tuoi].Label, [do_tuoi]"/>
      <item value="11: [khoang_cach].Label, [khoang_cach]"/>
      <item value="110100: [ma_tthn].Label, [ma_tthn], [ten_tthn%l]"/>
      <item value="1101001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="11011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1101001: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [ten_nh_bp3%l]"/>
      <item value="11011-1: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l]"/>
      <item value="1101001: [ma_bac].Label, [ma_bac], [ten_bac%l], [ten_nh_vtr2%l]"/>
      <item value="11000-1: [ma_ttnv].Label, [ma_ttnv], [ten_nh_vtr3%l]"/>
      <item value="1110000: [tt_nv].Label, [tt_nv], [tt_nv].Description"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyfhDnNMf1Xswv69ZqyKYqaD+gnyTK1Gh1WToOvfnHArIfU/QVHuz1jhMypUns7jI4NbYN5jdECTQDvOC1n1Sxk60zzo0/hJFEwhKI/keTVAUUxUDcA7ClJd8tGh9J0hSe+xLIcJ+VvjdyOv9YY9CBUHR60o4Fdxy0/yGTe84/GT8qRmW6YiqQkNWpFzy1LOFkfRsKMf90dV5YxmzJEOHpx6qb0wEMl/nJpG2oSW/VH33gy5HHofrDNVren5VSimQFIYxGx8ioOclGWTUG4jZK9aYhWR4Vs+bS3qibqCqFr1bvyR8ebr9xQvdLc3EuoZZi9c1x3QODaWVw15q2OJ2P24VXY0ibdeNkehqGBDIDlFk1Lds4SaNNfSqCelTVgwyw8VQO1Q8bwt5cP4uv3t5dsMVMBg5y4xhzUJuZ9krR40TiceaJZEIoK0nXyQMgqmTQJ/Wn3VzADmzbLqWJsAm66VTyQpQ1LcyyO+ptMkKAf7mv5nrGPYdbBoc0x48HiF4qHlRBfrYSm5YSQ8eVdn6FAv4dGqZEA5D5rNlxt1NdHGY/fzo9Xf4zSOyk4gUhxWJLFYlCRMk8eIXq/SbpP2ajIgZhVRO+b1DNObuiQyTS8Mvdp+sVgyniz2QO5bUcQhQiVmDFjc4sBoYhHjjZRBj3zs3gE6wQMz3HfTZPThrzV39NPCnvwxvOux+ZFio2OHSGMlskyQNnBk6LhwBGFth81THPzN7QK9uU/g9mTJtMQB</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6oVqgI+1J5dAPNfBxh9Xe9bz2DGQj65H0UYlz57mw8KZR8LiRISckU5KjGO6azb7XtXwJwcgQUWGBTgsn5AVrP9RS/uWNjZMJfLU0KwPVBg8f6d2hecbMdrm97F9sQwO2zBsvXjaPSrB+OIbRHhnChpjR3CCnaqbhgTqEKdvMTE0CR1BDKzYG5OlkxonL/5keOA+U56HGVDbzlckWbFzoFJklLM4LncWo3erIX3/fWQ195NndZ/2nvQW4qMpOSsBFBJLdhflTN8qESGTTeB2Z9wr9hmyQEJDrjIJxjr9Ctu7HoHwo03SF4/hXZIb1tBaktoHqF2NIbp5kb8SbHtTTENBklnU6EZDypN7zD8CGL79YrRQRKZwTNq/poYTikPPKdN1o9ecREl+PYF6d5DnLOjYnllRLDTHQbfie5+hjMNL33iCEUQ4NSJx+8f/9O8K09UllT4ONAVqWGLfqXKwBPrqj0r/fcXaXX00w2Gv+OSVmnt6RIm9m8TT7Bru0cp2kR1hhzZDAyZTeJWnlOd1tHzA/94Qrk8yML5O9KYDQ5rt/bnzTfnpByfNsbD3LtWr+dDDt2qSqWc6uMPJ3mKGl6</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>