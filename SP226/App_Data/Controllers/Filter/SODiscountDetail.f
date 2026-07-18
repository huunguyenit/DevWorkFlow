<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY FieldsList "ma_ck, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9, ma_vt, nh_vt1, nh_vt2, nh_vt3, nh_vt9, so_luong, ma_nt, ngay_hl">
]>

<dir table="dmck2" code="&FieldsList;" order="&FieldsList;" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết chiết khấu" e="Discount Detail Filter"></title>
  <fields>
    <field name="ma_ck" allowNulls="false">
      <header v="Chiết khấu" e="Discount"></header>
      <items style="AutoComplete" controller="Discount" reference="ten_ck%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NaTa+sGe9iXhqI4AF4hyy2RsybWLRQtcz6tTyAhAzYKfysyYOXECSAvBers7TpIyA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ck%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ck" disabled="true">
      <header v="Loại chiết khấu" e="Type"></header>
      <items style="AutoComplete" controller="DiscountType" reference="ten_loai_ck%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_ck%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ck" readOnly="true" external="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh9">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
      <items style="AutoComplete" controller="CustomerPriceClass" reference="ten_nh_kh9%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nh_kh9%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt9">
      <header v="Nhóm hàng tính giá" e="Item Price Class"></header>
      <items style="AutoComplete" controller="ItemPriceClass" reference="ten_nh_vt9%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nh_vt9%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="effectiveDate" defaultValue="new Date()">
      <header v="Hạn hiệu lực đến" e="Effective to"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_ck].Label, [ma_ck], [ten_ck%l]"/>
      <item value="11010: [loai_ck].Label, [loai_ck], [ten_loai_ck%l]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="11010: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="11010: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="11010: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="11010: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="11010: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="11010: [nh_vt9].Label, [nh_vt9], [ten_nh_vt9%l]"/>
      <item value="1101: [ngay_hl].Label, [ngay_hl], [kieu_ck]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDed6fdJSeYyuzLuX+eSdp/gQsDMTJI/wXkxXE9EyUhqkQE9sGmKPljm7XF547GtgM8hQZN/eguYcYIUfqVubx0=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/ITb1SeAHvMLhmvPMjy8CRlbFa4N3yzwWBjPdl8yXTFQNum5fti0Tck8zoU9Z/b0xzJrf3bypauFmrafKT5X7Q0gajjMobAdaYXaLhksZotfw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdPzybVQ8zyLx6JMMDzWp/u02cW3ignabIx3yph1UHRuF/2kA76qMkTySU1aO9UE7da1hl5q/E2EZdU/jSiMKp2j7FJnTlX26vY1SsihLdse+nGHX9Ij+VFrKolfuGuhMSQSGVt04Evzm8uwtzgwbSiaV9WcNq1Tp3swmcp8C+D8cqJUCgMbNqSe7ubeuybDSJKsCeWcyrolCyUQTZ7nCEshO6n3kv04BPuA+vWNypuA5bb2AcPz7XnMIXRHU8oY5AUdSzwtrZJahTUwY0fYCXkJDSmhmCD7ZJ03bXTs41iRpcshnQbe5+IabgNms6USQpyx05J7Xn561c45rX7Tvah/BraWhDT9a7CJyV0F9RU5TD18Pt3DDyFIs5a0uuYKAk+IiH4kfokdE7hMIVG6LmZLBrAuD9CN8AZzRxZNi1VWeCUDjBM8pyLkOJ2gvKkYzlBxTfwSbINGp78t5qKnDxgQhYUadIA22fEnwdG2HOsdFeCH8d+XDZFoJ03TZOVxJz7LyZB9aczNUhpp1xvT720tRZWgoJKu2hlPlIg4ZgbS5CmXyhxuaH1rDOja5oeoBAucdLoWqHm+FKu8jteN5Ltb+ftxaQKKCSfPS2CKm2AupJGZe8sR+KvfVCdMmOB7FkCsdSOezkTcW5yK1c98qc0N2OGPc46aYz1Q1pvsUCW+22QOe4k73ENZ8lrasEGy47dbP2+M6JI+KcRHfMlLWa8+NkyjxuFOZ9OGkLeZitAh1X1l+BIQHcPvxp5h+XS/eKoleEa7zlIWM1DbtBKAoD1AHS8ikDk2GizwYblxtnGy/V9OuMaVTl0LSWvuRFlsjvI4D7H9O3biFw1GvCGcnf5by+aBEezoCstWFWLfa2nNQTxBi7X1hns1kJBzrlQrzgzRdbUrk6QUpVt8hHUuZIr5tIG4J3uFPPnjOp4y9GPGvZiMIWUPWCpClyjEujEzhrcMb+TcPFRHKwMoshPyHFLN7cmNvxjBZ55MVhe9AUYlvkcBaAHMElXnB9dgZrF9H6peAXDuN4Mt4SOvmkL8aa50P8SdwnKBzmsJ4VNTUcSWHUPl3IA8CV+kLdt1/6IWlv4HTbhW/YHJkFKjusICeL9Fm+C4ydEy+/uv1dnuWoV6DETvKJcp+GDIC6MOFFk79xpz/porbgzzWsuA3//l0OLwQOUmxTOZJzgBGdMl0k02bNVqbDmO89yYaCmrzTORsUyx1esNtrj3csUI0PBzvsRma9ArSCJ4E4XPXSikHPScM1OKvhjKfnvTwfC871lSWnSCwfqsrbUCQP5LJqYmcQRU4oDbM+fopcZC/jRa5r7oiCGfV4SDGLyCyMHKlojO0tgGe0mcv0lnYwlOUDg7cT37mjXpWj30ue2pQ7IsbMPVFITFqwZ/hoPD6Wlz+Fv137k7i05F4Aykj4SIuIf7IuE55xI7M1FNtyt9jgX6f8uzVY8R/9+SpCRyuQ8S4aLsHf42CZI3QBOHRL2nmmIvQTqVxzW+0L6Lkkfjx8JoQnwSxf7eFDcKSucuaeWT3px+VLVZQN4E48guf4u0qWjdb5t5Dmpn1VjVz0mxZ8Ys0qAxS8HX74rFGQVvo91b9OsgAmg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Discount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5SGLIXYJci/gigFfD7TqI8WXQZEpuWjZUXtZ2Cbp71KXJQ36Tv6VVIvXi07Lwla2NQ8PCh7RlbpnFaK6EeqIBrhr/LgpLv9pRHtjYIZ0eO2hxTwvcEnl3mSYiRdgAWGsNN4Rbp6gbK6G8itxXBvbgRVMNHSJ9lfKgK1g6WzNB8TlMyg58lwBm/SdXaSGSJPSCXOpCWh5JOjRAp4y8teBTNj9Fswrj+rEKL/AybRGaf0A==</Encrypted>]]>
      </text>
    </action>

  </response>
</dir>