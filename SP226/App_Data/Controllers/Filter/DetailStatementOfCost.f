<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY CostingRequireFilterShowing SYSTEM "..\Include\Command\CostingRequireFilterShowing.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã sản phẩm" e="Product Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="loai_vt in ('41', '51')"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="so_lsx" allowNulls="false" align="right" maxLength="-109">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdUWAN8Rv/3qEiFFUCguYvduUmqX92hd9FzdNmMrsCUVNE2qZxU+II5PSV+43MbweA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Chọn báo cáo" e="Select Report"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="dinh_muc" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Lấy số liệu từ định mức" e="Get Data from BOM"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc" clientDefault="10">
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
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="111000: [dinh_muc].Label, [dinh_muc], [dinh_muc].Description"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000-: [kieu_bc].Label, [kieu_bc]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingRequireFilterShowing;

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QvUqKBJkBmka7U7NxWT8KltxOKnRazV7/fWbgeuYLABdpInReXW5D7o8vG5YIFo4NPVv6bS1OoYq5e+VkDDtAhNy5z8aORxjTswngdQyLLyNqV+ORWOWNJhezryEttsCOnOHmhIXpwEaQ4wt85pFE+lewqFBASVkMq6pOPrRyEzUGxx6SKSqpswSv9yyGePXGBBix+wzEFjGM/DwFA00bFZYf324fLYlhuHKuvKDHbtb9mkA79x/LCJcLaCeSOrAUDGYz8mh2/EpSXWX7c1t8sBoDsrnMLV5ttd3eoPFAEcfA7kGpnOOPJKc0Nw5AAPIRtrVVVZ8GQZK9nLKD2WqHaH/vzn2MZ8Y7tps3rJAbnA/QbZMP3eJ8Xn8inm8eTXsLb6aqMdUnr/4h/KcEk/rOVrMt/UDfOJrl+s+xygmjubBjq9FQ1QCzdgowSjKYw6aQ==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6SpwZK84k4SK1SlwSotoNMQUnjm5Xw6xH5mXdfHrxxH2ABiWnKytWvRbHWf7iTOKc8PkzYTJjMRnWk5AB1t6Tm4uBAPRiQJz+q33KKWmyritzeIkDjlgpI6QzdCIdAUGrRa0Y3q3e9qQdWmK3x7xMhUEXqbc3SRSn/+58vLgg3zn0yK1NtxcZaXNb2xENEhZrLqC6TXo6dVjUtduJz5XjofITOnJ6nvZ1xIoq12vigxawWGIb0+cJLAFMEwApmWdse848OauWjk/NiKix4N8iLLurf5sBBQOJSppcQ/BqUnTlSVxzzA5d/li1TN3T9ZkTuERbZuh9Noc/MQqYrkrdnA+paZh4Gxd+hh01cIFbZtQrIa66R0fiRCRpK4qj3sKRoj29k/1Y2xCPybc5HME5BJ7ArqCOSVW3ohjDoB5m4giDy8iMz0f8uFgC39mFiAmvHN8vjcpRug2RtYtG72FUQxAt98LsXTc5b/ixvXDAcHMyhW0lGynJJFSoHmEflSLZccfJpupSHHtDwws4RF6tTU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp5n7VUK/Zh4hosSXoi+lvspcYHHPYRsXMGvUdC/IAJ8V6X45rRrQqeTGohlYcDbvJAsT5/llpHvT5tu0q4AYiasTv16EIoRcx4T0RF973qxQDlyni2Tvo6+brx0RhVYz3gHriC53BrRmHLqodfJfGwMOMeKHaEJGyakFPpkIv137p1UGeSm6hXDTXoNSe3od59e+5rRonhnKVBPMg/zN03g5QHamlh4VlkMo53dU8K4d9f0WH8/1uPlOHaL7J3JzBsE5flcjBjPAGqKt+cVT6x0je8A2Kq0weCur5m2IR7/cGrV/lTpNncHReh9KbqfbMghi3J3VbaC7dfX71wZ266PXUkKaIF3EwqlfIm+V/Obra64fFWm97ndcjLixBvm/aWrgpYMWx11Pr6gLImU8q615kaR6N78kq4J4/oVeNWSpboP/yiGCYKiaa4qbwjLcut+MHhhMEo68+rTFce1cEQ8Nv4dQO9kMyw1io86dVVqZWJST1cbqn9moB68ph48L0hlSk95+JAxPQHiifFeKveVQwLA7wubXcklN1sjEqHqvXAf22/Tg80UTK0ZO1vt4nSr0EKDN/6x9UCEzLdt3yCTQNac9iBI3MUDe32xC8ddy1a0UACLB0uhSIBPGRY2L5PokbAFOex39nGFnwCFhzKv1xDnaZccbubEaGT+mCwu2dVTg/ZuW4YyN8N2jSlFQN51YgD1cA+tx6Dc/vz/dWqyHVbZ+vteFviVoTPFkCc4E/bxjzQsGHrU+XOlmcAQcgPaNrCgMOR9R6q1YRwtKiN+1D3FJEttl05B04aNhAHt27ryPoLGqBaPDNIvtUxJFulITN/Ckh7DaeDeKhD5b7y9BTWKgyTUDTIwd8us6ZH9o7qYP36tjrTDAxIFZyXVf9FV4whbGvR28SxzY8S91GIxupONY3YKwcT1JFnL5qYmBAij/HHQ5NHnzWAZdWOexsW7/01EZnH1MYilSdGWjk62eh6Dp87R90WJD5/E32//f77/dWYdBvsijr3Fp56ujLW5PLJ6okzu/8lZ034gZlEdTC+768Aa1Daj+5dCTTcFPx5KoMI3VvH9E8EHgVNthnZuuCigxsNvF/7zFVquLFE2WQvxVAe7ytOtpSjTiOSQNbmckztehi7MOdhOvi83q1IJnutB6/mnnC9E3vVMNT9woVO4DRp0cNPJaHDL26G1XFqNy4eRXC6gnHD/3To2Owp4gJ4H69idyjmRb7hchaA</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>