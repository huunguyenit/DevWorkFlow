<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="gnctkieuduyet" code="loai_duyet, ma_kieu" order="loai_duyet, ma_kieu" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="GNApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9ZEADnOW2ia+5y7dbHkYqAr0fQr8eyuTRKnFjOB+/w7CGkOuevLr0X7ovNN/RwF8UWhGk2iUZvMsKMxViO+dZhK</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" allowNulls="false">
      <header v="Mã kiểu duyệt" e="Approval Category"></header>
      <items style="AutoComplete" controller="GNApprovalCategory" reference="ten_kieu%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="ma_kieu$gndmkieuduyet.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvcs" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_hrbp" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tk" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tien" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
      <item value="11010: [ma_kieu].Label, [ma_kieu], [ten_kieu%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtcf/eMQ6JNuhKdkli442IkYCjONuFR1nzXFS9nee15era//ZpJ28ZHt4JKxxI4Xlm/YG4C7wvTy/TEuotAGyh/xPP/H3O7nxd+sHZjy2jws7360H8dTyzWTFyz97AkimLPcb7muo75yKvkWTuvrdMoBKkP8a/1aoZb7msSoThsq3vfxDYUQU9NQ3u7DDUrbMG1MZJe+nZ9AFK4dqqt9ZhF3Swk8VGnW9g9chU1si1F7+JnRIov61xqE4B3idSSG7HNe7YnUXjXmcWlhaf45jDo4UwwzCzAPp7k4u7PfCZ3yXOSv1giVp2JO4o6BX+B9x1gYVlwgjCu+xEd1DDW3V/FThFl2wgmdZAboiFJA2TzhAd+6b5l5sxz8cR3Jnq5Kz0PGLT2wO88llowIRlPvlTt</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qhflsc9QPOqLE6KpAGkST9lzkE2CeXXx6+awBx1UIpkCnM3+nzVIQ8JxyH3NGvs+jsByB46vIfOOh5Qho88jI8fzIIYQcBJnx2TtCkbEZCybhBsg9x6/D3q3anKxGjFpR9LC20PqyZ6OnNKqui2qEDWrM1TjV0GhYzpGLNqYLCR1HdEkCtdzcZzwhYPMCnTVNZbEafmlU3GR6CRtOrNM+fnaXyRHQRJSeEBNLhVOCBYKTmUA5lbNdp0A35Vhu/788Tb2IR7qeb3wWthkY9JzCVm1LLFvqS42nGHDbjuMFHw30L9i+mFPuHPhhmsScB0z7jvZA3qE00yMFgdlOoFsqAD2jKVTpaGWz00CpLSD3lCLZscZBOt+i/gEKszJ9hexyDmJGbJRVeS2On6fLe3vSJRImMhx3EDkzOx59H0EhLHdFnGvpzJNTToFawncIE1iz47Iz2GPBRwz4B2rSTkZsEHQgbhz+Mm6VY2rYcB+hGW4TV5AqJboNCUi5rgXIHGQCUlGK9Oy0TGMGAY4fYY7ul63MB4ZhRrms9jo6pPeB1MTvjfq5grffaLVCPhQayysr3Q8/3JMgbcbpo1Qu6nm9Wzv70c6EsDU+awzEIFEwgtqanMXoS+48oj24YbmElai9cfEFqKpJ+QiYkGU7BS2GH2CMSTIyRYaK+N+lBMbE7O75Q2+ciADDHo1RLpaAlkBMgFGs2jZt3bYNHzl22i9//bDz7VF2j7lyIuAIKE+kq3LlHJlUJiCyHSg56vXU/dC+ww0ahuk1sTk1jMlKDkspy2S+A6C0L/OXihvFiV7HLrnaQ0HMIG9D9Sr3mFH2mEcX/9Vdar/4n5Uz7jyPv4oayZW8E35VGixchdTZg2H4KNxgE9PjRNNCaD6iAi1Y0WHTdGJcoGrvO/rWovocEqTr9M</Encrypted>]]>
    </text>
  </script>
</dir>