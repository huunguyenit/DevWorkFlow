<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "Item">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY % Plan SYSTEM "..\Include\Plan.ent">
  %Plan;

  <!ENTITY % CRP SYSTEM "..\Include\CRP.ent">
  %CRP;

  <!ENTITY % Media SYSTEM "..\Include\Media.ent">
  %Media;

  <!ENTITY c "ItemUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "260">
  <!ENTITY k "ma_vt">
  <!ENTITY i "8">
  <!ENTITY Tag "dmvt">

  <!ENTITY j "4">
  <!ENTITY l "6">

  <!ENTITY MediaController "Item">
  <!ENTITY MediaSource "Media">
  <!ENTITY MediaTabIndex "5">
  <!ENTITY MediaTable "media">
  <!ENTITY MediaSysField "syskey">
  <!ENTITY MediaKeyField "ma_vt">
  <!ENTITY MediaImageField "ikey">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmvt" code="ma_vt" order="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vật tư" e="Item"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vt" allowNulls="false">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="ten_vt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="dvt" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Đơn vị tính" e="Unit of Measure"></header>
      <items style="AutoComplete" controller="UOM" reference="ten_dvt%l" normal="true" key="status = '1'" check="1 = 1" information="dvt$dmdvt.ten_dvt%l"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" categoryIndex="1">
      <header v="Nhiều đvt" e="Multi-UOM"></header>
    </field>
    <field name="vt_ton_kho" type="Boolean" clientDefault="true" defaultValue="true" categoryIndex="1">
      <header v="Theo dõi tồn kho" e="Stock Control"></header>
    </field>
    <field name="lo_yn" type="Boolean" categoryIndex="1">
      <header v="Theo dõi lô" e="Lot Control"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbNtHcBNSekQktLdawtgyK9n93HYBWDQYiTDKHGliiNe</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&+0rEXMATY9jCuGJnJmpBwEThv9nHXo5wiEYOhV5TmQ1gw2d3dBFabKsMptEFVgvt</Encrypted>]]></clientScript>
    </field>
    <field name="kk_yn" type="Boolean" clientDefault="Default" categoryIndex="1">
      <header v="Theo dõi kiểm kê" e="Physical Count"></header>
    </field>
    <field name="gia_ton" type="Byte" columns="3" categoryIndex="1">
      <header v="Cách tính giá tồn kho" e="Valuation Method"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="1">
          <text v="Giá trung bình" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>
    <field name="loai_vt" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt9" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm giá" e="Item Price Class"></header>
      <items style="AutoComplete" controller="ItemPriceClass" reference="ten_nh_vt9%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhvt2.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt9%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" clientDefault="Default" categoryIndex="1">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99FN8Iuvd5hY2KoDTdivxs5ss33RkpDDaqWuspoghScsk</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&SwQegWYbhoDH8RDDq6Oi41OmNL9PL/dgeo6+Whm29oaT6GFLh+6YRt1haQLW7UuC</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" categoryIndex="1">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" clientDefault="Default" categoryIndex="1">
      <header v="Thuế giá trị gia tăng" e="VAT"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue_nk" clientDefault="Default" categoryIndex="1">
      <header v="Thuế nhập khẩu" e="Import Tax"></header>
      <items style="AutoComplete" controller="ImportTax" reference="ten_thue_nk%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuenk.ten_thue%l"/>
    </field>
    <field name="ten_thue_nk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" allowNulls="false" clientDefault="Default"  categoryIndex="2">
      <header v="Tk vật tư" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" categoryIndex="2">
      <header v="Sửa tk vật tư" e="Edit Inventory Account"></header>
    </field>
    <field name="tk_gv" clientDefault="Default"  categoryIndex="2">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" clientDefault="Default"  categoryIndex="2">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dtnb" clientDefault="Default"  categoryIndex="2">
      <header v="Tk doanh thu nội bộ" e="Internal Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dtnb%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dtnb%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_tl" clientDefault="Default"  categoryIndex="2">
      <header v="Tk hàng bán trả lại" e="Sales Return Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_tl%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_tl%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_gghb" clientDefault="Default" categoryIndex="2">
      <header v="Tk giảm giá hàng bán" e="Sales Allowances Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gg%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gg%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dl" clientDefault="Default"  categoryIndex="2">
      <header v="Tk đại lý" e="Consignment Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dl%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_spdd" clientDefault="Default"  categoryIndex="2">
      <header v="Tk sản phẩm dở dang" e="WIP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_spdd%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_spdd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_cl_vt" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chênh lệch giá vốn" e="Cost Difference Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cl_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_ck" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chi phí khuyến mãi" e="Promotion Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpbh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpbh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="abc_code" dataFormatString=" , A, B, C" clientDefault="" categoryIndex="9">
      <header v="ABC" e="ABC Code"></header>
      <footer v="Phân loại kỹ thuật theo A, B hoặc C" e="Define an inventory categorization technique"></footer>
      <items style="Mask"/>
    </field>

    <field name="kieu_lo" type="Byte" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="3">
      <header v="Kiểu lô" e="Assignment"></header>
      <footer v="1 - Tính theo ngày nhập, 2 - Ngày sử dụng" e="1 - When Received, 2 - When Used"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_xuat" type="Byte" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right" categoryIndex="3">
      <header v="Cách xuất" e="Issue Method"></header>
      <footer v="1 - Theo hạn sử dụng, 2 - NTXT, 3 - Liên tục, 4 - NSXT" e="1 - Expiration, 2 - FIFO, 3 - Sequential, 4 - LIFO"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ngay_sp" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="3">
      <header v="Tg sử dụng (số ngày)" e="Shelf Life Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay_bh" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="3">
      <header v="Tg bảo hành (số ngày)" e="Warranty Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="tao_lo" type="Boolean" categoryIndex="3">
      <header v="Cho phép tạo lô ngay khi nhập" e="Allow creating lot when receiving"></header>
    </field>

    &PlanFields;
    &CRPFields;
    &MediaFields;

    <field name="ma_vt2" dataFormatString="@upperCaseFormat" categoryIndex="&l;">
      <header v="Mã phụ" e="Secondary ID"></header>
      <items style="Mask"/>
    </field>
    <field name="nuoc_sx" categoryIndex="&l;">
      <header v="Nước sản xuất" e="Manufacturer"></header>
    </field>
    <field name="xcolor" categoryIndex="&l;">
      <header v="Màu sắc" e="Color"></header>
    </field>
    <field name="xsize" categoryIndex="&l;">
      <header v="Kích cỡ" e="Size"></header>
    </field>
    <field name="xstyle" categoryIndex="&l;">
      <header v="Kiểu" e="Style"></header>
    </field>
    <field name="gauge" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Tiêu chuẩn đánh giá" e="Gauge"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="dvtgauge" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="height" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Cao" e="Height"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtheight" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="length" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Dài" e="Length"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtlength" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="width" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Rộng" e="Width"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtwidth" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="volume" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtvolume" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="weight" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtweight" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="weight2" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Bao bì" e="Packing"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtweight2" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="packs" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Số gói" e="Packs/Carton"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtpacks" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="pack_size" categoryIndex="&l;">
      <header v="Kích cỡ gói" e="Pack Size"></header>
    </field>

    <field name="height0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Cao" e="Height"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtheight0" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="length0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Dài" e="Length"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtlength0" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="width0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Rộng" e="Width"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtwidth0" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="depth" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Sâu" e="Depth"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtdepth" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="diameter" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Đường kính" e="Diameter"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtdiameter" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="volume0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtvolume0" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="weight0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtweight0" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="density" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="&l;">
      <header v="Mật độ" e="Density"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtdensity" categoryIndex="&l;">
      <header v="" e=""></header>
    </field>
    <field name="sl_min" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Số lượng tồn tối thiểu" e="Minimum Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_max" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Số lượng tồn tối đa" e="Maximum Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="lShipping" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&l;">
      <header v="Vận chuyển" e="Shipping"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="lItem" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&l;">
      <header v="Mặt hàng" e="Item"></header>
    </field>
    <field name="volume9" external="true" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="Default" defaultValue="0" categoryIndex="&l;">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99FN8Iuvd5hY2KoDTdivxs5ss33RkpDDaqWuspoghScsk</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulJvMM8h6WeHJymnLjMjAyI=</Encrypted>]]></clientScript>
    </field>
    <field name="dvtvolume9" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&l;">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99FN8Iuvd5hY2KoDTdivxs5ss33RkpDDaqWuspoghScsk</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulJvMM8h6WeHJymnLjMjAyI=</Encrypted>]]></clientScript>
    </field>
    <field name="weight9" external="true" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="Default" defaultValue="0" categoryIndex="&l;">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99FN8Iuvd5hY2KoDTdivxs5ss33RkpDDaqWuspoghScsk</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulJvMM8h6WeHJymnLjMjAyI=</Encrypted>]]></clientScript>
    </field>
    <field name="dvtweight9" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&l;">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99FN8Iuvd5hY2KoDTdivxs5ss33RkpDDaqWuspoghScsk</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulJvMM8h6WeHJymnLjMjAyI=</Encrypted>]]></clientScript>
    </field>

    &UnitFields;
  </fields>

  <views>
    <view id="Dir" height="320" anchor="&j1;">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_vt].Label, [ma_vt]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11000: [ten_vt2].Label, [ten_vt2]"/>

      <item value="10100111: [dvt].Label, [dvt], [nhieu_dvt], [nhieu_dvt].Label, [ten_dvt%l]"/>
      <item value="11110110: [vt_ton_kho], [vt_ton_kho].Label, [lo_yn], [lo_yn].Label, [kk_yn], [kk_yn].Label"/>
      <item value="1010000: [gia_ton].Label, [gia_ton]"/>
      <item value="10100100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="10100100: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="10100100: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="10100100: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="10100100: [nh_vt9].Label, [nh_vt9], [ten_nh_vt9%l]"/>
      <item value="10100100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="10100100: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="10100100: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="10100100: [ma_thue_nk].Label, [ma_thue_nk], [ten_thue_nk%l]"/>

      <item value="110010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11: [sua_tk_vt].Label, [sua_tk_vt]"/>
      <item value="110010: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110010: [tk_dtnb].Label, [tk_dtnb], [ten_tk_dtnb%l]"/>
      <item value="110010: [tk_tl].Label, [tk_tl], [ten_tk_tl%l]"/>
      <item value="110010: [tk_gghb].Label, [tk_gghb], [ten_tk_gg%l]"/>
      <item value="110010: [tk_dl].Label, [tk_dl], [ten_tk_dl%l]"/>
      <item value="110010: [tk_spdd].Label, [tk_spdd], [ten_tk_spdd%l]"/>
      <item value="110010: [tk_cl_vt].Label, [tk_cl_vt], [ten_tk_cl_vt%l]"/>
      <item value="110010: [tk_ck].Label, [tk_ck], [ten_tk_ck%l]"/>
      <item value="110010: [tk_cpbh].Label, [tk_cpbh], [ten_tk_cpbh%l]"/>

      <item value="110100: [kieu_lo].Label, [kieu_lo], [kieu_lo].Description"/>
      <item value="110100: [cach_xuat].Label, [cach_xuat], [cach_xuat].Description"/>
      <item value="1100: [so_ngay_sp].Label, [so_ngay_sp]"/>
      <item value="1100: [so_ngay_bh].Label, [so_ngay_bh]"/>
      <item value="-11000: [tao_lo], [tao_lo].Label"/>

      &PlanView;
      &CRPView;
      &MediaViews;

      <item value="1010-1010-: [ma_vt2].Label, [ma_vt2], [xcolor].Label, [xcolor]"/>
      <item value="1010-1010-: [nuoc_sx].Label, [nuoc_sx], [xsize].Label, [xsize]"/>
      <item value="1011-1010-: [gauge].Label, [gauge], [dvtgauge], [xstyle].Label, [xstyle]"/>
      <item value="1000-1000-: [gauge].Description, [lShipping].Description"/>

      <item value="1000-10000: [lShipping].Label, [lItem].Label"/>
      <item value="-111--111-: [height].Label, [height], [dvtheight], [height0].Label, [height0], [dvtheight0]"/>
      <item value="-111--111-: [length].Label, [length], [dvtlength], [length0].Label, [length0], [dvtlength0]"/>

      <item value="-111--111-: [width].Label, [width], [dvtwidth], [width0].Label, [width0], [dvtwidth0]"/>
      <item value="-111--111-: [volume9].Label, [volume9], [dvtvolume9], [depth].Label, [depth], [dvtdepth]"/>
      <item value="-111--111-: [weight9].Label, [weight9], [dvtweight9], [diameter].Label, [diameter], [dvtdiameter]"/>
      <item value="-111--111-: [weight2].Label, [weight2], [dvtweight2], [volume0].Label, [volume0], [dvtvolume0]"/>
      <item value="-111--111-: [packs].Label, [packs], [dvtpacks], [weight0].Label, [weight0], [dvtweight0]"/>
      <item value="-110--111-: [pack_size].Label, [pack_size], [density].Label, [density], [dvtdensity]"/>

      &UnitViews;

      <item value="1110001: [abc_code].Label, [abc_code], [abc_code].Description, [volume]"/>
      <item value="110---1: [sl_min].Label, [sl_min], [dvtvolume]"/>
      <item value="110---1: [sl_max].Label, [sl_max], [weight]"/>
      <item value="1000001: [ghi_chu].Description, [dvtweight]"/>
      <item value="110000-: [ghi_chu].Label, [ghi_chu]"/>
      <item value="111000-: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="25, 95, 25, 5, 70, 25, 75, 230" anchor="&j2;">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 25, 5, 70, 100, 230" anchor="&j3;">
          <header v="Tài khoản" e="Account"/>
        </category>
        <category index="3" columns="120, 25, 5, 70, 100, 230" anchor="&j3;">
          <header v="Lô" e="Lot"/>
        </category>

        &PlanCategory;
        &MediaCategory;

        <category index="&l;" columns="8, 112, 70, 30, 55, 8, 112, 70, 30, 55" split="5">
          <header v="Kích cỡ/màu sắc" e="Size/Style/Color"/>
        </category>

        &UnitCategory;

        <category index="9" columns="120, 30, 70, 30, 70, 230, 0" anchor="&j1;">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>

    <view id="Form" height="305">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_vt].Label, [ma_vt]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11000: [ten_vt2].Label, [ten_vt2]"/>

      <item value="-10100111: [dvt].Label, [dvt], [nhieu_dvt], [nhieu_dvt].Label, [ten_dvt%l]"/>
      <item value="-10111011: [vt_ton_kho].Label, [vt_ton_kho], [lo_yn], [lo_yn].Label, [kk_yn], [kk_yn].Label"/>
      <item value="-1010000: [gia_ton].Label, [gia_ton]"/>
      <item value="-10100100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="-10100100: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="-10100100: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="-10100100: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="-10100100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="-10100100: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="-10100100: [ma_thue_nk].Label, [ma_thue_nk], [ten_thue_nk%l]"/>
      <item value="1101100001: [ma_vi_tri], [status].Label, [status], [status].Description, [ten_vi_tri%l]"/>

      <item value="110010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11: [sua_tk_vt].Label, [sua_tk_vt]"/>
      <item value="110010: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110010: [tk_dtnb].Label, [tk_dtnb], [ten_tk_dtnb%l]"/>
      <item value="110010: [tk_tl].Label, [tk_tl], [ten_tk_tl%l]"/>
      <item value="110010: [tk_gghb].Label, [tk_gghb], [ten_tk_gg%l]"/>
      <item value="1100101111: [tk_dl].Label, [tk_dl], [ten_tk_dl%l], [width0], [dvtwidth0], [width], [dvtwidth]"/>
      <item value="1100101111: [tk_spdd].Label, [tk_spdd], [ten_tk_spdd%l], [volume0], [dvtvolume0], [depth], [dvtdepth]"/>
      <item value="1100101111: [tk_cl_vt].Label, [tk_cl_vt], [ten_tk_cl_vt%l], [weight0], [dvtweight0], [diameter], [dvtdiameter]"/>
      <item value="1100101111: [tk_ck].Label, [tk_ck], [ten_tk_ck%l], [lItem], [height0], [dvtheight0], [height]"/>
      <item value="1100101111: [tk_cpbh].Label, [tk_cpbh], [ten_tk_cpbh%l], [gauge], [dvtgauge], [xstyle], [lShipping]"/>

      <item value="11100011111: [abc_code].Label, [abc_code], [abc_code].Description, [kieu_lo], [length0], [dvtlength0], [length], [dvtlength]"/>
      <item value="110---11111: [sl_min].Label, [sl_min], [cach_xuat], [dvtheight], [pack_size], [density], [dvtdensity]"/>
      <item value="110---111--: [sl_max].Label, [sl_max], [so_ngay_sp], [weight2], [dvtweight2]"/>
      <item value="1101-----11: [volume].Label, [volume], [dvtvolume], [volume9], [dvtvolume9]"/>
      <item value="1101-----11: [weight].Label, [weight], [dvtweight], [weight9], [dvtweight9]"/>
      <item value="100000111--: [ghi_chu].Description, [tao_lo], [packs], [dvtpacks]"/>
      <item value="11000011111: [ghi_chu].Label, [ghi_chu], [so_ngay_bh], [ma_vt2], [xcolor], [nuoc_sx], [xsize]"/>

      <categories>
        <category index="1" columns="0, 25, 95, 25, 5, 70, 25, 75, 230, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 25, 5, 70, 100, 230, 0, 0, 0, 0">
          <header v="Tài khoản" e="Account"/>
        </category>
        <category index="9" columns="120, 30, 70, 30, 70, 230, 0, 0, 0, 0, 0, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        &MediaCommandShowing;
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGaZfS7ghIYsMmVQ6TxmvfPS3sB/JA0CjZytM8acqSPM</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&SwQegWYbhoDH8RDDq6Oi45XEdJohoZ8cpe8ay62BfoffdtrAdCl0DFZr0Qbm63mzYsq8qN7ExMc51E2Xhw8wrg==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&+0rEXMATY9jCuGJnJmpBwOvT5Wp8gm+mZPq7TmB1lKMXuYITQdx7CrwP+EYC21f6eBV7mIJMS4Rp7ADeIn7Txw==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qeIDfi0+DG+TJyOgXyDhEa1</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &MediaCreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGaZfS7ghIYsMmVQ6TxmvfPS3sB/JA0CjZytM8acqSPM</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&SwQegWYbhoDH8RDDq6Oi45XEdJohoZ8cpe8ay62BfoeLsjWHmyBMjP2/Jgbi3j6lK4DZg/JmeTZF1N3/u7Zfzg==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&iNTvL9TOYeOsm2RypSuPkoDUVph5e3jY+6LuB86rAVKs7nNRL95znvWqRxUbBYcK</Encrypted>]]>&MediaScattering;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ1z/ThtRrQvtD50PZb3Ml73IJbgoKvHjAm8DFcU0JDe+</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &MediaCommandInitExternal;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW5OC432NMjUGwMhak/AtgLH4Zu1xeeE04bxFjpvu88GJC80DjHQ0FoCpxAdLqfWgr05M8a1ZCcpTuqvVFijvwkd</Encrypted>]]>&Item.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdiQVpNK5v2TJ7zaHlDKHvs/5nvNWGb/YQtMLEnkUumTtiosQrMTCUlxafiwtgmjXzfITtNOVxwwGcmivmuA/q2RSgknYpDZgLEHBJuB+hGTT3aQ76/JPrFt9ZXwDGIfHag==</Encrypted>]]>&Item.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2cXlhK+O3jwXWuw+KS3REZUpEydSkFPjFYZqSBwTgnHNwm8RpTJPLUhOvHvCjc6oS1GOA9hV56/F1zODpNVbYIG+VS1Ah+rv4nLbTf/udtjt9ubwSXORGfsGLU9OST03US5b+gcD6vfUuN5WPjg7PV+qVAnyXZXigTaFqkIfEkOf2+1femAq9YRa7nRZ86U0tV3jf9pwY6oe5UyCXCPN4qhlW3YIaL75oh29Y/0bEoSmKpOs0A81x+ujgliD1NwqxV+WNA8GwuouISwrPah18ybvfo7wanGUHv13elFdA87uszoLdULtUaWX20qu2R40npyZl8Ru8PbtFc1TxD+k1nBZ9QxWS6kF7owNGt70OKGq2SSo9r5etbfmrPns6EW+5ZyrSCY9F4hcaMngsG5who5U0OXPqrxZ/eysoM198Jt2</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &MediaTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&Item.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYbU0T4146T6fWXrQ8C+/76LJM6SzLvfsvpaHueLOave</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4S64GN5uFYuMcVYJOp0tFtVj86N3+0+SmirvocfVm/phOCSpGjsK2AxOkMqD1SdC3xWWh/XxMxY7cg7RDT9WtBDDMZshNOkfjdnP8Ng15irJ</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5c1j+Wr2K7L6HNiErnRlrZ+0aimQrL9AmglfETnN8sFUTVeAYCvKpZmwFsayEmTWEUtMmK3LRigRJ/XKh2JS4qrcoFb6r/nQhKoCqRrteV6yiJQjg/rYyqSH7fp27HC6is7uId0oioXMwYozXXzXYfPYXUhZLU0Vl+DH7N9Zkee8</Encrypted>]]>
      </text>
    </command>
    <command event="Inserted">
      <text>
        &UnitPostInsert;
        &MediaCommandInserted;
      </text>
    </command>

    <command event="Updating">
      <text>
        &MediaTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLaYYvUwshZeUHBKUZ0GAmFRI1FGfvwSekf5MxBi5s6v95Rg4s9MKHYmXuOM+2ZmqV</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4S64GN5uFYuMcVYJOp0tFtVj86N3+0+SmirvocfVm/ph+mY87cAZeDDOF591KK3TghPkAOk0IMn35brlH4yXz23DWJ3ZRg9S5nNEfF1mUNXfUCKzFPiEt0ZhN6tAzs8vSQ==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZaCd5Bh5oMymvb6OQZrDy7rhnONLsMQEFDkfkULV/MRDhQV+Pmy4plmoZ3NbnPgEszt+vLOg6hr20Xsnwn23cM4nL94dSUiz3WXtE6UhMfguC9EpP0ZUoMj/sbG+5hWBkvtwFT885sN5VlYyvejmvy4ogdsnsXdbPwZS7yJZ04RsOTdyI8Odr7zimac1uH4oKNLfdCwX2w2rmgC7ahrMux+bHY75rz//lbGAMhJ6WX94a3CeZpFIzjBM145lBSESqhdhXgbjlSiIMVGni1l0vU=</Encrypted>]]>&Item.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVJd3xfsDn8VWU7hoR0+RhkjIh6BWE430EhuzliwqdMX6tqFZiIs1bFx+m6ZilkAcCg==</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTNQLH5kl1JFSccTu0XIFDzWWhH1v0v7g9V72tlq//3cJa4BWji5OL46buGRvgK/XIRvo01LtBV3PMjTl0NAlgsV</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TLvDViM7bBsAJhTtruafyATM+E6qUAu5X+ug++NYAQheLZfovSEzyTiB06drwECUYVm3shzds0zNB9GoYcm/2B0S5hJzFPKBCtjz1jfGfWSsEA2fK5Iy6TXRxBPuMSkrGn/w4KNS/xqws91Iwe3GlFgYx7hQriBlVY5jeQ58SZmne/UOnfUjzqL28AsfQQVkdlglJwXhFLnwbLkBO4zBmHDPZRNiDkXkJA/8kJDsmOU</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTMvhpHmK9XXc7r9lAb6hdzbPywuQhHrK3Cu6XXbi0J78w==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VF2WRgpIggrKmmMabguzvIgHc/TGxRKrn7lmvC6zFOmg7UsNJ8iKpJd5fzweARty8SWOaWA8y8s5fWpWltGuJ4H0b9hRfn0dzh/ygBXJtNK</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTMvhpHmK9XXc7r9lAb6hdzbPywuQhHrK3Cu6XXbi0J78w==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VF2WRgpIggrKmmMabguzvIgHc/TGxRKrn7lmvC6zFOmxxiyQn3xJr9bxYdH6/ROjc9+qCsCuQt0iicnYjb2stLmVhflA/MXRXukkM8ib0OcNzEXDACU/LSpO7IQu6DNlg==</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTMvhpHmK9XXc7r9lAb6hdzbPywuQhHrK3Cu6XXbi0J78w==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VF2WRgpIggrKmmMabguzvIgHc/TGxRKrn7lmvC6zFOm1seWjWRYuLXMn2aGZMKVnd7gBdzx4cnXf3zDwHZJiBU9svWgpmm3qVVK1iDFVbpt</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTMvhpHmK9XXc7r9lAb6hdzbPywuQhHrK3Cu6XXbi0J78w==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VF2WRgpIggrKmmMabguzvIgHc/TGxRKrn7lmvC6zFOmB2L4lOS/YTfEbRDgsQUBcNpjB21ETwTg5bcdgiJhlrS4YBKMF0FN1sVBEysBAUSUP8j14qG9qEafsKC7wRoxUprrOP67CsFSMg7h6JNSBbE=</Encrypted>]]>&MediaCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eqAMOMB0N3eZfuw4RMilTMvhpHmK9XXc7r9lAb6hdzbPywuQhHrK3Cu6XXbi0J78w==</Encrypted>]]>&MediaTicketReset;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TPJWtr6lTFEV7lBxD6HPGfg6oCvfatF6fCwp2bJ8F7c</Encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8v+JfqEFgW07YAd0DpYgtBzuthjlP6n5tjJXtUaSQ0UglAX5et3Ah4kR/hYtiQo0WWl/ZByW7zvPDxIHAPAb2/GCpY28Hwi79yJfnX57fjZo1QzO2XLUqBR/MwabP5mV2ILFbXNJylWefq4OAs9H+qolNTAjzekSCvLs8p2LCUUj9G8/OP46YFcd3B17CWB58wpO65+dDI0Se4zxnNvjJwAVwBn8z69OFNvdkxg0DSciyr11eA1rilnoTwbPwVSMBHwK+VLyf8EmNlqodVAP6mwI224BT2mE0Q33KwHn3cThnGm1D9L9EGctV1UXVNtKguEUJ7DJCGEbuA+oNBLLjOjw8vy5jSCPXhMWao/jOc0</Encrypted>]]>
        &UnitPostUpdate;
        &MediaCommandUpdated;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLvcZe0l6+1rLmmIWvZKrdC0RPVc96bnYqAXhKGFb3hPvmCP7DVickU5XKYKAsFtiVUl/5hGa3YXSr3lFH4ciTsTAVO6oJW+EFDzSdDRMQzRuzLuIXWX6cilZpgtYJPYtzNZ5LApMKqrrqbyE1MRPOFTjqPjh7PDs7G9MswhebiHb/A==</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &MediaCommandDeleted;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
        &MediaChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QdJeo72/y66Nfm6a2cviVCvNESnGL7OjywCWPixhDZt</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&SwQegWYbhoDH8RDDq6Oi42HiGX6uN1cbgHMH9l08CVQAzhm8TXafsf4DECS2Tprcn7YxLFYYvVb2z34L1ckPuzAW4zMlKy45v3eftzut1Ewkl792vLrnlEZSQahd8PuGBih06gGlv6ntDiXwt9liYexkFjqP2LK1OCsscism78ydo/bdYXmxeN8yGLisAWiy</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&+0rEXMATY9jCuGJnJmpBwKkol1HA6+InfFcMMF4ctsSvZF6H9OAK0Ig0b3TQkD5nippcacN+udq2skTjIcOAMdaSnVE1mLC1m75YMcDDyL2pG8tEzV4rIiuaHjrkOTugy1pI9m/E5RiUiefRPYTsJZdRoZ5kGrpHRjnb3b6mR6fqCaN2tzlktN1Y3bP07BoMaQ0kbfxTI5i2nIg62O4eXQ==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjE6ET5pwU1lPXoM29kTvRO0vmNxw+M7CujZtN7eOU9ternTFQeT5M/40U9+GyAInERUgOiE4Y4SgpDeFQaUc5TOB7yoFwPp/wg4FBV57RaRnCmJNt8zadQI5aQcfSzoyiIvVz+vDdcAbXnX2yZYJiJbk25jXJA9LhDUtSKH2Jmw7</Encrypted>]]>&PlanTab;&MediaTab;<![CDATA[<Encrypted>&+SuglMQSt+n+m5qoThXlz8qsvQ/Qq2MKNg89m2oKGzvAyB0P4dKXiE9OeA+oQsCw</Encrypted>]]>&UnitTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/789/M+g/vDsaInSgzejGljfJvBpD/vIYfnZvsncA7KkXbtq4/0o4bZgiXWfNLQySp1uaXSSyJuhkUE9BKdzxyUP86ADlonVvtkh+3VdvnpOrITTLA5oWlY5LmxnQqDheMbA==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrbi4tlFAMWyXRH+qRzAyXo0ACedTme46HOqgWzA0oZAQ</Encrypted>]]>&MediaScriptActive;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZtVBjsJG80bJVLq+fx9tX+YpHxNfibEElfsbXphl+Fwii1tE0pkUnqqHsAwoUoFhjIiLsRsmpL8D6rMDrQhn+6gWcwDW2eRb1a3dGh8cL0+</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/wtom6IlazhB/ZqGhNn+8y1cnyXwxWCURx6/a4VHARI2pG+qEZ/3sU7lpnLByQtxe7g25bv6yqMUAqEtrLEGsBA=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjibwzRob0wmBxy6J1R391KXNkfu/2i4PZc6QHsyJw+0qCs+W4vOEnlA2t/dtNPwFBVr/VPszihJBJlf/vVL5o6P</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFydQyDJEWQcT9b3p7KM5oA/ChITouhu/XQbbgG07sj99NkXEozlDmXVZUeyCii29ecWSIgSY60AvE2U3YE+zar/RrVsuiwAlS57SOZ48H0EaIRzAdPrK1sFt1xSjCamYu3Q==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&iNTvL9TOYeOsm2RypSuPkmZO6aMzEd8Q8UXIe/vXjJS0kji1ulwyMuAUQNaXc8VN/uD6ZuTHODE7BcaMxL8ofFH3Y0bsTzmw3nRJXVtOAzY=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSJeBbk3qX5ZRcloDuBsk8/ccnX7DvZRAz0KnQgAFH8QkUX4VnqKt4Hqteo3D9FSzLh3mqqruaOkV6v4IphmaHkwQmPOBgIJnGlYdL0sLSX9</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDRbDZFAzIA3X1qjoEbHr31fGZSHCQ637vQGPSShFUXkuS1KVT8DXBtkEwPIijizSLVV8rgZeBDkRpXF4xAl/dG0</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq/w9hxR4IVRmCjHnEl3Ny/9Dz1RPgvP91RH4ttFrXfa97TVMq4j0A3UArLpUpeOJ1ewcOzaGmGdgnHrIkF5cF8D</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/wtom6IlazhB/ZqGhNn+8y1/MSMXTh5LaqIIOvDnxNF1XaslfsEpMXyLECtPde7aGSQI3E7J4Lh748AWWVYfHfkTmP73Caet6dx6ngdHXmkzm/YagRYRbdEk/+KEZxm0UA==</Encrypted>]]>&MediaScriptClose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8Yh2njqNHe5T8F8uHc/U3Z/</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99KJA7nN0tOB0SsFNX+FuOC5A6bPmhxafAXvjQocliOrP4UQlBwESKfjoqcpR0z3t1QyvYtTLSfkCkgYOAJqD8g3SO9tZToasM99xb9Bh6ZfYtl8v0B8hLN79SDGcRABJQokWIblF2Cy2R9+7gJ8RlTPA7Y8uzOZNBxqZMChxZJsk=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/y4echwLwd6GKkrcxpwIjor3sNFTtq3Wiqe0gZepwE8pSu3m//ddnABN3l9FuotBrIVp9hO5gaIOCRCSQfH7rWFADFGJjaVC75bRIVk3dK4wmSPj1UWSriilMw+ZLqcrzA==</Encrypted>]]>&MediaScriptShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxr4eRJ1M+7QLwlVyvsFA3Cg==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&iNTvL9TOYeOsm2RypSuPknixYRlTG//40PkqFvQT6Ai1O/B/3+JWp64PGqIDccFReg2NjYqoPdVTci6bfcfcM43KJoi7GVPOwetWwmm3G9PDF4UPctc/XVQZBDFM0MP31/K6+AQ3RN49BGBOB6yAZOTCoTX38w8eKlv1phM5XhUG83VzXG9DqsvogZOj20pFdJDTgkSyWjecQaJ1fwkFcq7D10OAO8phqaw0ntrawhlroo22WJrsX4g2l64vDMDZXcQ6UBzMJrGp2b6us4PZ4YG7rSUZ6OzsQReGNdCz+Ug=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO1+bPA6JYXj0axo8f2J6h9BfN2+/g1ej0sGul1Lk8jYsEcI9O5aZDGDcBUaDR4xMb12KE/YZqn1KL7aTuTatZLo0+ynScVSs3SnO6jW7qHcsGKmNATtgeM4CJb4FON4Af/H6KsM7q9lEzlUKdyd/klk=</Encrypted>]]>
      &ScriptSuggestion;
      &MediaScript;
    </text>
  </script>

  <response>
    &XMLSuggestion;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElALvsE3YUD1J338oot8nd2v7MT/XbXohgiSUXaLqoFipvk5FeXVIX3AjzPjbXXFJqSyv4BSa/BXxt5Pb6vs2nsW</Encrypted>]]>
      &MediaCss;
    </text>
  </css>
</dir>