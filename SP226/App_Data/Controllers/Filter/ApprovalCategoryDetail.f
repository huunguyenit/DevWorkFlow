<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="ctkieuduyet" code="loai_duyet, ma_kieu" order="loai_duyet, ma_kieu" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua" e="1 - Purchase Requisition, 2 - Purchase Order"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9aLtWjDmxh2oHvtFk7CmysuVusKUTyfBXwQ3WgYaRJZfQp8io5u6J1v2FpqWNxxtFM=</Encrypted>]]></clientScript>
    </field>
    <field name="ma_kieu" allowNulls="false">
      <header v="Mã kiểu duyệt" e="Approval Category"></header>
      <items style="AutoComplete" controller="ApprovalCategory" reference="ten_kieu%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="ma_kieu$dmkieuduyet.ten_kieu%l"/>
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
    <field name="ma_md" filterSource="Vacant">
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
    <field name="tien" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
      <item value="11010: [ma_kieu].Label, [ma_kieu], [ten_kieu%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtcf/eMQ6JNuhKdkli442IklBr8ZzOsnCVM2ZiwU+CG6R4weOd8sn7Z/pHvZR6cA3JF43ZE8uOdj/UGEvVMkDsEfQzqf+nu3ynMO6R09fZWjFbQtplaBAHhwZ/h7BTCnLgsHENJtPVJzH4FmFAU1Q4F0qSFAH09q+lyZ5DzU8w+Ng1yVKRQh+l24zz03CqbfYBKHx/9T7gQ+gAgg5rCHKDbfOk2fXG1XRAXtwpEuozTc8TE767n9TpsdKfHE8Xm+24=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qhflsc9QPOqLE6KpAGkST9lzkE2CeXXx6+awBx1UIpkCnM3+nzVIQ8JxyH3NGvs+juMdX9opO3C3YnyiZHSmUo6duNkPkQBpmpyKsxtavTB5I0OkIeQgpP1v77jA0EC6yeBtqDk3juhUplxSDK41K98LxF+Q2IIwZtpaBqS80mKH1azFdt6l0cYBXMaCi2iMU68+IV5KWZbWaKfd8XYnUHPnIthh0bfIoQAvz8o7lZjDcOW7Ll+E0bl691oqGvnB5kUTzFFx6ZhsAHGLMLHmkQaU4e+qInyB+L58TGmi/zWMjAcSn2jiuesrf+xbxpNcnWKX92QSFSkx/R+KjKexXK02SOSoadnDcmnJSGFN25EgF235rIh8Xtns9RqdMZaMROR4jcXUmmo/DcvUgLc22bCh8HZmGdk2tFPvWVa2zPUGbVwPH2xvzjeGYd7vunAByJtVahwJ2Ah+3nHprf5pA/9VL64584TDMRM1dvzJ/dRK2G7P30bbO5p0ztASK1cnNeyqP83/Hok4yhxSIRfnXW+uinwYzP5GSM9xfq6mrNkJQLi7EBQ2CTUPI3FkQgiOpGftTFWeuqAC2LQM5Bcs1UW5IkCaY/ur6eEWVu/DOADOCwgQJbf/CV6R1QZpxIGs2OMb/IrPiRkZ7wvl03ZjP6RP7NjngJnvF6ZCNy3uQUGSLGaHnQQfV+UbebmJA7kV69LayS/U9CsHAekiIffP01i/iU+D1JSfk8fXl81prSqxvretzTvDl2ghk7bHFfXWvYPLjcjuf6wtBYERR6v1vpMUNXi6LDeynzS9YPXh6Icjd9OWDxMuL0g63h2JAgP57rfg+UnylzejwGAR4iwSezxlxAcycFR2IAfHu33xttPq7e7T+OTERWXPDGQuyEdG7tVRNiP1P9c8UF0fgOL/U9uiUFYAwsbqvtVRLnF+gu46g==</Encrypted>]]>
    </text>
  </script>
</dir>