<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY dataFormatRate "### ### ### ##0.00">
]>

<dir table="hrbhdstg" code="nam, ky, dot, stt_rec, loai_thay_doi, ngay_thay_doi" order="nam, ky, ma_nv, loai_thay_doi, ngay_thay_doi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lao động tham gia bảo hiểm" e="Insurance Information"></title>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" dataFormatString="#0" readOnly="true" hidden="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="dot" type="Int16" isPrimaryKey="true" clientDefault="Default" defaultValue="1" dataFormatString="#0" allowNulls="false">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_thay_doi" isPrimaryKey="true" allowNulls="false">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" key="status = 1" check="1=1" reference="ten_loai%l" information="ma_loai$hrdmltdbh.ten_loai%l" new="Default"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_qd_giam">
      <footer v="Số/ngày QĐ giảm" e="Decrease Number/Date Decision"></footer>
      <header v="Số QĐ giảm" e="Decision No."></header>
    </field>
    <field name="ngay_qd_giam" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày quyết định" e="Date of Decision"></header>
    </field>
    <field name="tra_bhyt" type="Boolean" clientDefault="Default" defaultValue="0">
      <header v="Không trả thẻ BHYT" e="Not Return HI Card"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="ngay_thay_doi" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày thay đổi" e="Change Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày đến" e="Date to"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
    </field>
    <field name="tinh_trang" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Tình trạng" e="Status"></header>
      <footer v="0 - Chưa xác nhận, 1 - Xác nhận" e="0 - Unconfirmed, 1 - Confirmed"></footer>
      <items style="Mask"/>
    </field>

    <field name="ky_sau_yn" type="Boolean" align ="right">
      <header v="Nghỉ việc báo giảm tháng sau" e="Decrease in the next month"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="dc_pn" type="Boolean" align ="right">
      <header v="Điều chỉnh số phải nộp" e="Adjust the Premium to be paid"></header>
      <items style="CheckBox"></items>
    </field>

    <field name="hs_luong_cb0" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Hs lương cơ bản" e="Basic Salary Coefficient"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin cũ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Old Information&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv0" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp chức vụ" e="Position Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot0" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp vượt khung" e="Off-scale Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn0" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp thâm niên" e="Seniority Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv0" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp khu vực" e="Region Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="luong0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Lương" e="Salary"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Phụ cấp lương" e="Allowances"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Các khoản bổ sung" e="Additional Payment"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Mức đóng" e="Sum of Payment"></header>
      <items style="Numeric"/>
    </field>

    <field name="hs_luong_cb" type="Decimal" dataFormatString="&dataFormatRate;" align ="right">
      <header v="Hs lương cb" e=" Basic Salary Coefficient"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin mới&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;New Information&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp cv" e="Position Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp vk" e="Off-scale Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp tn" e="Seniority Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv" type="Decimal" dataFormatString="&dataFormatRate;" align ="right" categoryIndex="2">
      <header v="Phụ cấp kv" e="Region Allowance"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="luong" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Lương" e="Salary"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Phụ cấp lương" e="Allowances"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Các khoản bổ sung" e="Additional Payment"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOfmxC5/avi9JSWzBoPz+wx8YIAtl8M9Yy7oXLHoo3ado=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="2">
      <header v="Mức đóng" e="Sum of Payment"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_xh_tang" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHXH" e="SI Rate"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Tăng&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Increase&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nLiJCn9DPqSjtiFRJdtD/ITYlxhYs7VClfzHTitb9As90=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_tang" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHYT" e="HI Rate"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nLWELh7su1I43NlbzMXdMksurG8uJ0TV05rknmqtffHhI=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_tang" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHTN" e="UI Rate"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nLF9Fp89Bh6Cn+g+rHpC7xJ3aUhjIjQe5O86oHqNrg3Ww=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>

    <field name="tl_xh_giam" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHXH" e="SI Rate"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Giảm&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Decrease&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nL7kRmIwTLmOq1QtHbeNwW7Gar8Ebk0ajP5H3Zqlg8sNU=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_giam" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHYT" e="HI Rate"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nL6Bx3RICCZhVUK8SgSyJn892eLixjp/po+55WZUUWk7Q=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_giam" type="Decimal" dataFormatString="#0.00" align="right" categoryIndex="3">
      <header v="Tỷ lệ BHTN" e="UI Rate"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZb9gCcyaUM0acE6K16bMBTH9xuuFiEVcebYykDG194nLTFr7NpibOO04FDn2zTR+thtatAyRiHvnwWACOnpXs+A=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>

    <field name="luong_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" external="true" defaultValue="0" readOnly="true">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
      <items style="Numeric"/>
    </field>

    <field name="loai_trich" dataFormatString="1, 2, 3" clientDefault="1" align="right" categoryIndex="3">
      <header v="Loại trích" e="Type of Contribution"></header>
      <footer v="1 - Trích từ công ty và nhân viên, 2 - Trích từ nhân viên, 3 - Trích từ công ty" e="1 - Business and Labor, 2 - Labor, 3 - Business"></footer>
      <items style="Mask"/>
    </field>

    <field name="muc_dong_xh0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="3">
      <header v="Đóng trần cũ BHXH" e="SI Old Ceiling Salary"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXPLdtWuoJu6KEnwcXBeNrO8C7RB7itL1Z5leCwbCvQOcQrFql2X56EfqnVrBP02WaroMh1EiD0eDWec6A9M0Nw=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="muc_dong_yt0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="3">
      <header v="BHYT" e="HI"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_dong_tn0" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right" categoryIndex="3">
      <header v="BHTN" e="UI"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_cu" categoryIndex="3">
      <header v="Thông tin cũ" e="Old Information"></header>
    </field>
    <field name="tt_moi" categoryIndex="3">
      <header v="Thông tin mới" e="New Information"></header>
    </field>
    <field name="ghi_chu" categoryIndex="3">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="kieu_td" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tinh_chat" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="120, 30, 70, 0, 30, 70, 30, 30, 70, 100, 0, 0"/>
      <item value="11--------11: [dot].Label, [dot], [ky], [nam]"/>
      <item value="110-10000000: [ma_nv].Label, [ma_nv], [ho_ten]"/>
      <item value="110-------11: [ngay_thay_doi].Label, [ngay_thay_doi], [stt_rec], [tinh_chat]"/>
      <item value="110-1000001: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l], [kieu_td]"/>
      <item value="110-10------: [so_qd_giam].Description, [so_qd_giam], [ngay_qd_giam]"/>
      <item value="-11000000000: [tra_bhyt], [tra_bhyt].Label"/>
      <item value="110-101100--: [ngay_tu].Description, [ngay_tu], [ngay_den], [dc_pn], [dc_pn].Label"/>
      <item value="111000110000: [tinh_trang].Label, [tinh_trang], [tinh_trang].Description, [ky_sau_yn], [ky_sau_yn].Label"/>

      <item value="-10-10-----: [hs_luong_cb0].Description, [hs_luong_cb].Description"/>
      <item value="110-10------: [hs_luong_cb0].Label, [hs_luong_cb0], [hs_luong_cb]"/>
      <item value="110-10------: [phu_cap_cv0].Label, [phu_cap_cv0], [phu_cap_cv]"/>
      <item value="110-10------: [phu_cap_vuot0].Label, [phu_cap_vuot0], [phu_cap_vuot]"/>
      <item value="110-10------: [phu_cap_tn0].Label, [phu_cap_tn0], [phu_cap_tn]"/>
      <item value="110-10------: [phu_cap_kv0].Label, [phu_cap_kv0], [phu_cap_kv]"/>
      <item value="110-10------: [luong0].Label, [luong0], [luong]"/>
      <item value="110-10------: [phu_cap_lg0].Label, [phu_cap_lg0], [phu_cap_lg]"/>
      <item value="110-10------: [phu_cap_khac0].Label, [phu_cap_khac0], [phu_cap_khac]"/>

      <item value="110-10-----1: [luong_cb0].Label, [luong_cb0], [luong_cb], [luong_tt]"/>

      <item value="-10-10------: [tl_xh_tang].Description, [tl_xh_giam].Description"/>
      <item value="110-10------: [tl_xh_tang].Label, [tl_xh_tang], [tl_xh_giam]"/>
      <item value="110-10------: [tl_yt_tang].Label, [tl_yt_tang], [tl_yt_giam]"/>
      <item value="110-10------: [tl_tn_tang].Label, [tl_tn_tang], [tl_tn_giam]"/>

      <item value="111000000000: [loai_trich].Label, [loai_trich], [loai_trich].Description"/>
      <item value="110-110110--: [muc_dong_xh0].Label, [muc_dong_xh0], [muc_dong_yt0].Label, [muc_dong_yt0], [muc_dong_tn0].Label, [muc_dong_tn0]"/>

      <item value="110000000000: [tt_cu].Label, [tt_cu]"/>
      <item value="110000000000: [tt_moi].Label, [tt_moi]"/>
      <item value="110000000000: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="2" columns="120, 30, 70, 0, 30, 70, 70, 30, 30, 100, 0, 0">
          <header v="Thông tin lương" e="Salary Information"/>
        </category>
        <category index="3" columns="120, 30, 70, 0, 65, 35, 65, 65, 70, 30, 0, 0">
          <header v="Thông tin bảo hiểm" e="Insurance Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UKYdBRoc/1+Ooxro0wM004rrFpKOdej3QGeVkeVK/q4x5E1QoP6nadnqtVf/d/PFS+Vlxi0JQe3mnXjOHGQJ6gGfu+tT6H+yRTPj+nBQvpQ+RkTBDVMptf1zXhSqFQ/ON9uzte+sxWyYa18A4qa25BpHGbMB8vZW4Ef7eg2H2FYBVMWQ/UgBcbeyFOSWRaCS+jaDeERtDe0kW2V6pR6ON1hJST0f1t0UcR+NEsSxm+JZcWnuzmPMU4olNQaqTeiz0hPAalVF1MFswpGpQzno8lbKbBh4pV9i5oH4MGwg3OoXFTLa7LajzPu198MAEdNVFj2VzmN3kp4I8HEh9nvhsK6/LYEMPm1RwRNLrKhqpdhGE57i6IaSxvC0NPDwNwXPw==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRbPUawhrTK2J0ZWULbx3MAyZEgCzmA7qp37+2SxNy3xfPDBxIftFluRFGNbj0RH0fGqgadvCL/dlvIPK1oxHxfaql+tEVnbSQSRAosNytaRz4Hf4gce1CuC2zK94JODxjg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2TP0yOeTTQnIkUatVMKL6DBGRv6irPWp+gzK6ZFEGFbffNGACVncMYQ8ule6Gn8eKxjbLxx54McKRFvUDFtAvObgm++7cmFnf1tk3rtIcV0</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivDlk0rPC3qob/iWX3ePv5I7kCMb6uI9O0aiAlMrbRcbmbtZyxwvmShOQQfn81fdswp1zsPG5LovRHcSs0MGZOLf3fPqDZWSkvhk76ou2ZiLC5wiH3jf91cORw+1Q6om36L0ir/IxrNUPnCJ5L73fRq2+h2l0fgnvW4j8+nQgjcBxtojDh43L6CKuc5IqLsjokqJDPHzt7+W0HHsaftK12obXmyV3yHj1ke4wQqEyiBZNBAoO4WSlKR7P9g5peVfr3G1T1RUNOCEsciWXGWNB/40UmPdT/VDRDXvCIusLFNWJzf+6PKmm5vrRTagMj0vH+Mz7eopiBdQmsGWPqt/lO1uh9DdfsMtyTJn1EAJLi3E7cOfAbJGwj0+BTPXEeKoMJegLjfwpYPBF4s3B9oeaeNckAXgQ+HDZpePZEPO6XC9IB9x+IvS2F+s90J6uuOAEloDTDmgS2lokAz6I7f6VoDudp0Ed0VM0jQ9XfPxKTpNiA5Hx+F8sYd3jYyt7hTP4qar7FXvGKPk4NOgYvi48iJPVMKJpz7jske5C0wKcZpw=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zurSw8Axd9lQIRRTD9CUoQmt6BnXhh0RhvLUFPdRDL2UTBgJZRQPkboWZRkW2GiKW4xt736kR9Ybzs/hp55r/3N4+GrVtDXv2w7R6eFI77ZhhFQlaC21iHmp6ZYOM4djuyL0XVqsI+U3p8p/rqzdryUWdF71wlDMzvOJx9pGONop3qyQUknoaja1RadXSmyWKldI7kaYwI0V3yrK93mYTdUGP8aQBMhXJDnrn/CDmIhyPpMnyQwDV6x8QebPv6D1P35Z+hVEECU+NYm/wUsGfzeWV98hpU+pC3xrwDylIr1bkQ4jdtVklJ85uJyYEMnMeTspMyoAFM1/jXighqHrlv+uuiW6w/Fjiru1EwwFAY1OVmodQeI7lTrC+yPP+N879rAyDBZK+akXCrv3ViFjiUrzu92+VKQw3f157wjEzKm7BvqV/JQALW7bi7kss2YaB3NaTgit55f2hDjZhv2zqjSFOGYO3aj/4bG5UelbHFL4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cMoh5XUPM5CpNXkcSXpTk5EAQ5oWpo21SNv8M/i2DjnBI0UD/3Q/H8HplAsFnoPQJQG5ePSPnbdQJoDLL7YHlmwc9VOzEy80Wg76JNvAsrSFL2v47BMtak+vze04ZCNFjAv23enUlkO/v0fVJ5hYHn7HTpndHsP3LaKgo98Sm5LoP7YOFGe/wnJZweUKZtI91U7KI91DhrL+hXAl8ybwU6ax0u0+OcKT+KX/f9bh2FYaqQd0mnFy00CCvqXZdtXQDDQ2TRVmjPLwKvBe+7MEGv2A3jdyEYxE784lwaCxKJNJEoOvSqk+GnCxEglNv7lZeRzPDru5+YwpVfpoTTTXyG81cfcSUPH0MQ7hrT2NCIGc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3ENdUHD6oX25Vl0wNQKwLJK+ibGyWRGk5TXsQRJF/MdPKQ9Yrl+UMq4BeVlYEd4IkWX+sgXOrynBORUtxqDBI+VJzoQ+mYInQxrpWJCia3gMxhejnQOUPClgL9H+W35MOXshtqU5pQNxIQDTzUDPrLQRQu27935fb9s6OtHIXcNe95A1LNsZoRjsXqlPY3JDN5aZyaqZss0zXLgf7LtXApI2oLG0nwBNZDutlXRMz8G0vm2gDMnExLEKQuCzgprV8+WgktsdViBculSvUNZ2fFfafnVBQq/MF0aZZGJw8beT2aELr2WBRYb/ljagkv8ywTQkIOlIJFMs70yDPQbqJalu2Q3KlsYzi7q9Xyw5L7OZa2P93sK3wCi02FCIIMDiX3KrlaNYMGOXBn/HoJPNvkgqpdNfFZOg51Zh3fISNvzuS2dab8Zm8MLKq7d+lnaOoHwi/5qLrHl3b4WAXr76vmJjblZiTJnd91Ks5RkOBlSVWx+qTwg/YifXsxTKH9snQvCZWgLCECvtBZmkNbs1h5013em9VeBIOIS6q/S2NUg2KdaNlHzLWrf5l9e500+n/WIBWapLtLTSBx/UNvfuMOEAjXXG+6LrF+LrlF3/suidxhGwVbTsdWN7MRvrllwdVSqSr6y0FdNjagkmAQPtey+e4YNK/P6bzk2+OAdH+KFAq87U8sJbn/7Fa68WCUK9Eu5DyCSrhQrC81J81v5haqHdV9mF/zlCV0sDg2Vo0PCF0ugVS+piUXAdydo/O14JRxOyn8cq0UKigWFByQzM+3He1DBQiRTj+t0XVLN0ehxeBgECSD1leWx5H44WkVFpVQLrRi7pPA/zhuqQJK94a43jAvxd5k9ehCE/5eKfXRzVDOoMXPM+cvTFDS6mfJrBFZzf3AqSRyXquqzjhOaOjSnbuEBhzXiLphB83BT1Gcxq7/ib2v1eoAbEkSCVVfJpZfGkZdlgA5eW44JxNQUo6wTZbdpVq6a+/PmkWQsz/GkILno2CbPHaR2iqzpZZIGh0GTPPQ2gm9HYhbWaTIRL8g=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AyJeh/IE+iKsOwLz0SohdLLuGxGk+N8Kun2sOgUdHQ4CPdAAPAprpmPhdLc7pBzDrGUPVsNK46j0ZbDT6AccMl85aXNHTw/pcEAjuODVV2yF2nKrh44Q6/A9UlQpBxBrZ3phXaZwStEFLF4WS+YwbB7kp1YSUB6M9aYIqz0PiHPndxD3mDFp8PQDriT3dMDxwUnNouEQFTD+E/5KbIwP+zXgG83EctR9B01MOTQpiOwP1BLgvMKvF/vRC50o2kerAaGH8wPdF7Ez0AxzHT2TbRykTZ6d2ASSTAFYJrye2I2r9WyhdtQ0ALjJIGk2OvDdgqImH98w3E5KKuAMCUh7g5A9AHKX9IrYe0r5zq+0ELjyvF+me+KmpuWziDEmeuXQ+qz/HLy052MShm1wBOMFFIa0bw/KY2F24aITEpAQpWJUVB9I9sQ43+VDLBVAKG9vP</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UXcjMJdTY5cl1GDjkXhMiN2grvnRYYfPCXbmYWcSWlR9R3AZ93Pb0QjhS7ATrda2l7CtXcomLF4zlN/f6EylsPjpwlQvqBtgw+1+cv3nWB+XjeWAF2oSRmFD6WLwy21GpfW6K4jdIesY1ih5CXdzGjxFrtGAOe6q+EWfpSoxGcBIrSEex0pYvtWsNoWjz5aWxe2C4D/il+wNz/VOWqKRxXbPQhgEmDPpIXI0cMu5aTZ6k1SRe7Aao+nOY3LJRIUJinvQYQqEuBemiT4Izvvq0T+1d16ce8DBKivtpPx4wWo8asPhKFZ3vgB/js/XgQD+vDCv8Idy/qinZCHmwv7TYGOtO3OM5oY8BcKA2G8XctbESSJwCYqYCrkw16aQd4VTG2x5Fx28DKQR7MFFGFwWEerRTS2a2SAAOR3UR3O0cYXl58+1eihFVXd4yz+lPpZjYcojBq0zfZ2eSzU2I1F6ixYNAT0wsJjgQyTiGQmydMu8yjBeVwLmOXE9v207fv+cT9GKzK8ZocCUT1Q4fqlnpZK6LHYAWwZp0s8SUkMTrwXX2jlla6i9rcJaPo6hw879zWY+Y0vDXM+/ZTTRmwd/PZVUJ3gH0zTxFv9ZrWcRtUppC1yEgSfCBUgU8GkVka4SDRCGtSWd4G6duCD3FKz/tRrPqv42zWgK9OlWvADSm84dmJ1fwK0EDuVcWdw+3NsaNgbXnjzpZ8PoGsf3LyDmupk3pCqJ25UlUMyR2LQ5ACDkgdh/Ktzry3/yGW4CutVQRCoT3JQC5YA6Vwgo1598ncMuWT2T3/83nyDEW5CFTmA8yHz3aV4kTQll3S+xlbXeCrEDy/V+rDEBBbpdd7MXtlNiGjhN+ZxtaLBpr7LPhm0bnZKvXA5FQNPZHfjdVbcBBD0GoIU/jlb17F/aQIhuqUNv8mkvr23b8jF7Ri3MWStmoFha1Fb9Q+OuBpd0FWKtaR41isBJm2/jbhFhU7dRwlw8s0C40HKNUS2pw/47cHumffydZ7GzzXIvdk2HRdkmwwl3I2DAAqI2UcHC7mFJ5dSdveS4BuR8oZLR1LsSV5770qSv9Doj/OM5uhgFtaUmRmNyCLg3QnttsNxtHxzhSQ7ahmFH1n5uMaKwnPRoJxxKo10OqHmyOWQyCPf9LoYtvrTZKpgifyoM3CEuOhRE5Y=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="InsuranceInfo">
      <text>
        <![CDATA[<encrypted>%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</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6afkp2ROukT1C5E5nHT+IgoDT1J+NiFJzVGrTP/UkVix522a+F0KToxFADDuZ4Y+tg==</encrypted>]]>
    </text>
  </css>
</dir>