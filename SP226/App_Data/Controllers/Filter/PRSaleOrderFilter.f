<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Identity "PRSaleOrder">
]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" id="PR1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_nhan1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Require from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Require from/to"/>
    </field>
    <field name="ngay_nhan2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Require to"></header>
    </field>

    <field name="ngay_dat1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày đặt hàng từ" e="Release from"></header>
      <footer v="Ngày đặt hàng từ/đến" e="Release from/to"></footer>
    </field>
    <field name="ngay_dat2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày đặt hàng đến" e="Release to"></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0'"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="xac_nhan_yn" categoryIndex="1" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Đã xác nhận" e="Confirmed"></footer>
      <items style="CheckBox"/>
    </field>

    <field name="sap_xep">
      <header v="Sắp xếp theo" e="Sort by"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Ngày đặt" e="Release Date"/>
        </item>
        <item value="2">
          <text v="Mã hàng" e="Item Code"/>
        </item>
        <item value="3">
          <text v="Ngày yêu cầu" e="Due date"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_nhan1].Description, [ngay_nhan1], [ngay_nhan2]"/>
      <item value="1101: [ngay_dat1].Description, [ngay_dat1], [ngay_dat2]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11: [xac_nhan_yn].Description, [xac_nhan_yn]"/>
      <item value="11000: [sap_xep].Label, [sap_xep]"/>
    </view>
  </views>

  <commands>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0jXdVeD55S8lIn9bqpo2tSjivCOeDnKqphKvRLp+Hr/BD1yVhBdAE+3I0gtNipYBA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjnHJAuoQzfeROKYc0mdV+y6YuIzo+LO5yN24egzCBavEo3YNoRdJ9fzz9FdK5iqdOOWYghFz3ATfpBA3Z25UGmXgOYpKHRMJekMuuqUFgYQvqF7S3Zt+PWx7b19LsjBcJg4l5EFkaYNcyx3MJWnT3FPsPQ5AUwszJ30W+G1mCMdnyztj/lgclkQ9RtfvGc58XNAePFL4+CrbT3SRBtWJ9O3hB6mc4O5yO0T8qoUw2eJP25F8X5x9duqZB0+5YkE51ZAkIdgKAxEetNTSG0fMgpU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ETbhk+SJrKIRGCKN+eMCJxB37ZnZO4VYMF0TOK4x/yy</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjnHJAuoQzfeROKYc0mdV+y6WC3kvVfiDyoocUmLu/Grsq0YXpKhwRw41NaIk756ApA74SM2xNYShPsLeolstr+Ndx88bpmJ75nwVbCUAAYyvzpLeCJ6YlWIXbKrZMc1F60Iib/I927Pc+f+UHA56hInCJMcv3WuiRgHGj0kf3Gj7uv2G6Cvw0EzFSCpQJw5szfjDclrV3s1bGoG+kxaexd0ot+ZPa/of2inc5uDtacC2bKoMStgwSKRbey2+MlaIGQSauv78iqFCBRYlepz1ppI=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjs8cBFdYIjrEvH6QghTKUdyHruYa1kryktbZ2rlNYPfbeiePUUxnNkGsPVyjITmklQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjsDJXojFZ/PDmGU0rQ/XeZSozu5EJHwj61UgAESX5ehYz+vYaByMjGRlqRt9puTc4w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjtTXA6p5z+XVSu7BG+MF+ycU4Hu+oqYtFCcldzipkF/ph9pZjhLcjwjmEkoqkSjQ7L2npQxX/G3ytRlBbshQiec=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjtTXA6p5z+XVSu7BG+MF+yeMH+KGatxYZs9c5PpGQ1U49qB4B5Jf81+S9qpNJsMDPA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9NPqy8Xf1ae1vxsCwTpbyLJXIRssO2CZ4qQ7keWUjmyg9tzW/oUYMuLiiV+Y/dx1BA==</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Smp4pImCiX6bT99HyVOGjELgoAnd8oE6Y4W1ZX9biGUuap6ggpIPmdJZSVB87uU72SGeMmRmo2pJBTaqzhW1S+moZI57C08gtaTbVTxj2XI6pKCNDxOO8mHpxJDtqY2Qp+/ltPKPQT0iHNd2G+SjlA=</encrypted>]]>
    </text>
  </css>
</dir>