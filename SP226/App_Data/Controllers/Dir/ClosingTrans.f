<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % ManagementObjectTransaction "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>

<dir table="dmkc" code="stt" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bút toán kết chuyển tự động" e="Closing Entry Definition"></title>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="loai_kc" dataFormatString="1 ,2, 3, 4" clientDefault="1" align="right" inactivate="false" >
      <header v="Loại kết chuyển" e="Closing Type"></header>
      <footer v="1 - Tk có sang tk nợ, 2 - Tk nợ sang tk có, 3 - Lãi hoặc lỗ, 4 - Thuế GTGT" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account, 3 - P&amp;L, 4 - VAT"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bm9g2+tty7MUBJEcHp9hcLChF03UK1p9Hfwg5Iga4NLW2/FlAPzWLmPAc2Qe9Sdhw==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_no" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1'" check="" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_co" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1'" check="" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="kc_ct_yn" type="Boolean" inactivate="true">
      <header v="Chỉ kết chuyển các phát sinh chi tiết" e="Closing Detail Transaction only"></header>
      <footer v="&lt;span class=&quot;LabelDescription&quot;&gt;Kết chuyển theo&lt;/span&gt;" e="&lt;span class=&quot;LabelDescription&quot;&gt;Closing Transaction by&lt;/span&gt;"></footer>
    </field>

    <field name="kc_vv_yn" type="Boolean">
      <header v="Vụ việc" e="Job"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_kh_yn" type="Boolean">
      <header v="Khách hàng" e="Customer"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_sp_yn" type="Boolean" >
      <header v="Sản phẩm" e="Product"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>

    <field name="kc_bp_yn" type="Boolean">
      <header v="Bộ phận" e="Department"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_lsx_yn" type="Boolean">
      <header v="Lsx" e="MO"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_hd_yn" type="Boolean">
      <header v="Hợp đồng" e="Contract"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_ku_yn" type="Boolean">
      <header v="Khế ước" e="Loan Contract"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>

    <field name="kc_phi_yn" type="Boolean">
      <header v="Phí" e="Expense"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>

    <field name="kc_td1_yn" type="Boolean" readOnly="&ManagementObjectFormFieldHidden;" hidden="&ManagementObjectFormFieldHidden;">
      <header v="&Name.Field1.v;" e="&Name.Field1.e;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_td2_yn" type="Boolean" readOnly="&ManagementObjectFormFieldHidden;" hidden="&ManagementObjectFormFieldHidden;">
      <header v="&Name.Field2.v;" e="&Name.Field2.e;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>
    <field name="kc_td3_yn" type="Boolean" readOnly="&ManagementObjectFormFieldHidden;" hidden="&ManagementObjectFormFieldHidden;">
      <header v="&Name.Field3.v;" e="&Name.Field3.e;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJaoHXJoxx0UEErGvrv2GQcCVnEuLBj3RWrSKsaf50qUzqOCbiD4lc+bHYmVDgDjqMw==</Encrypted>]]></clientScript>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25"/>
      <item value="1010: [stt].Label, [stt]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_kc].Label, [loai_kc], [loai_kc].Description"/>
      <item value="101000100000: [tk_no].Label, [tk_no],[ten_tk_no%l]"/>
      <item value="101000100000: [tk_co].Label, [tk_co],[ten_tk_co%l]"/>

      <item value="100001: [kc_ct_yn].Label, [kc_ct_yn]"/>
      <item value="100000000000: [kc_vv_yn].Description"/>
      <item value="10000: [kc_ct_yn].Description"/>

      <item value="-11---11--11: [kc_vv_yn].Label, [kc_vv_yn], [kc_lsx_yn].Label, [kc_lsx_yn], [kc_td1_yn].Label, [kc_td1_yn]"/>
      <item value="-11---11--11: [kc_kh_yn].Label, [kc_kh_yn], [kc_hd_yn].Label, [kc_hd_yn], [kc_td2_yn].Label, [kc_td2_yn]"/>
      <item value="-11---11--11: [kc_sp_yn].Label, [kc_sp_yn], [kc_ku_yn].Label, [kc_ku_yn], [kc_td3_yn].Label, [kc_td3_yn]"/>
      <item value="-11---11: [kc_bp_yn].Label, [kc_bp_yn], [kc_phi_yn].Label, [kc_phi_yn]"/>

      <item value="-10000000000: [kc_vv_yn].Description"/>
      <item value="101010000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPKMHjMBpXAUgrdXVxpBJ+T41qzG7SaCx9FzuU206SSbhvmi3YAP9q4fTbTxgmToiA+IQLzhKNIEEJSDuVkBTls=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPKMHjMBpXAUgrdXVxpBJ+T41qzG7SaCx9FzuU206SSbhvmi3YAP9q4fTbTxgmToiA+IQLzhKNIEEJSDuVkBTls=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7yQXqGj/Z9MadUpxjxPIGGvCZZbf9BoF7dav+kRY88dkP/omEk8QNHSdeelDXFkq/kdPQl4K29GL7K519GSkX5HMT3gwvuxWD0dSsWrforGE7fr+v/BmaWcBNJIy/VCD7PrrVlHp1Nz92SSYz/iJFgKPnkZ5x3PcP4YNwjdhOeIgSmcUDF5D66xvDfGbDmSpXCRVAYOeKdM8AmdykJuDaXkaN6x04c1DWwA9O8tpnWCifpODg6lMBlSZLNoXx/o5SB/mI/F7dijivcRwhORSrhlF2Zy94Dyd5dW/KqjkrepWSV9IElR6ZZLfacYX+Cu2AhKwDiudnU/ePlAxGXKtyVaGTpMiSS0xxYYXaB8n9ePN+tnO4lHDJt3hm9OiLsHy5qxInlkev/v/zVPNIPJB0wq5GSQ2llJhS0riULk7EhyHSkOLEiwkKRHWOIzfghpkQjZy8kp8bc99n8aAvOnpizp9kIoxN6Cy0ueCYvwiYMNIn9FqeMXYJqxRodmBebPgZQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUBUgvILv8fX2H2isRcGbpwQ7fs4xPp/IYeR2cxFbWoXe0yqMguC8KcUhLNoi8qz6LVM9t8XG80+JEn3klxea1nvSfzQe9bf9VQDfOcec56ue3Q02T2ZiP0LkkySXjeqI2roXGEuqV+fEmq9c3+nNOvRs/zJZRqYdYPrU662G/MDc3Z+2LSMGwyVOow8u/4fiWmoFKyUjABb43kQ4XB9AxuvbmQxflge6DuPBQBm/YyFZjjuX5vh0ac8MKksvWXAeQgd18gsAd1/v7R5Xp1/zVhw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLIDb2MoHi59roFVyJaERXz4IRzKFqtsBvgLbDccoukjB0YJ5ZZxihxFRzl6Lvg2TQ19Bnur4QhVyxu73Jv+3ja1AGt1kHZ+VvX3Boi+wYArcEwjeazV+vuWcNTu/3wq9T4dEEA4onldHFVjFyFwljz5w/LtiV651fLyoGdpVnMCNSr/IrKa9QMseIKTiVxaQQOIXZoBj+PrjPlYlyPLP2+A==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5zN4orqPIV9C00O1tpyH9OAHyaJT9N/SCDdELc22YQbr97TvhmUDzVlpjhfVa95q6xhh1Ya5ypJjhF8N16eIm7ZbHZNbcO3yAAoXd+I0fqFrZUmCSQ52Px29tspxU4YeYuDHaE5iBezueyOv8Sh4jkJZYLBFcgmWNWb1G9z2A3ioQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KUSr/baZpnMYFh0X33aWcpssTOT1stGhjdb8hZHrwDIPF7hcCP8TsPqFFF/HOsBfj7H+ZpSNwOQ4DB56K3uxpnaepBrF/lL46NAmmbpE/SifOYEr4p5uvJiSjjxxqTvLVNwAyp/UqvRRoS3fNK4U6EfFM4qe69WR2SIonRksZvKTbWroz9viQjYTqOKUVLp2BpQ4rILHiAsNxr7xY5puIVUAYetpZpmf8xxrm1ebAgTlkvuzrkBgVSvND9Y0gox6WG9fBDtI/cEhe7Ej2gv7D8TXYoJWRY8Dtl0GIp3P58g9IaQVkSAm4H7wdz1vrw37Nq1yAAP60RPN8/OjebZq6Gl/o49WOxvcqR3AxkLs7z5hA3ij1B79xcHb98ui8eZR0nYKaeda5je64g9CKm/cu5DwFaM9xT0onVhLxbYkMw</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJted5NfHO/PDM/wjEKR0d6wIFaD6FEdq2hjhSyO0tWHs1JcD1IqeyFZEqThg6dxbHYgk3PTLcG9J8xG4yhwSYXyjN/uv+KShpxhUfRy4AYMgyJqMyL72cfAgMMcWTserSbDExQACl3+mjTp+1rWVWxlVxvVroeHjv2HrYEbYNkcIqhA2Ypaw1R40pxghsBy2VkzMoMyp3Sfeu5U99nE0WOWkp4gYSr1BKSVHJUcWZGeMCs87q7BTB/Bqf1lpvYvWjSLua9iw44ks9UUTWgBfgb/j/KShhp96KF5fM1TJrNMsK9T5AD4j1lfvasNQh3gxgKdNLyCHUi7MFXa+Cx5uMmdlSnxXGSqssCIBm4dp1A/3AXuPKqMSzXBYBdecHfgr0W7PHvoyewD0Y8NLq73JyBKDkIiqN4kufEJuYy1PlpXKlltYjSO1hOoak4zNjcdqXq8G6/yS9yB/igRMSbHUq/Xs=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>
</dir>