<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrEmployeeSalaryInformation;
  %Extender.Ignore;
]>

<dir table="hrnv" code="stt_rec" order="stt_rec" type="Voucher" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin lương nhân viên" e="Employee Salary Information Input"></title>
  <partition table="hrnv" prime="hrnv" field="stt_rec" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>

    <field name="ma_nv">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_nv" readOnly="true">
      <header v="Họ nhân viên" e="Last Name"></header>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="Tên nhân viên" e="First Name"></header>
      <footer v="Họ và tên" e="Employee Name"></footer>
    </field>
    <field name="ho_ten" external="true" defaultValue="rtrim(ho_nv) + space(1) + ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" inactivate="true">
      <header v="Ngày vào công ty" e="Join Date"></header>
    </field>
    <field name="bo_phan" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" readOnly="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_nh" clientDefault="Default" external="true" defaultValue="''" allowContain="true">
      <header v="Tk ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ma_nh" clientDefault="Default" external="true" defaultValue="''" allowContain="true">
      <header v="Ngân hàng" e="Bank Code"></header>
      <items style="AutoComplete" controller="hrBankList" reference="ten_nh%l" key="status = '1'" check="1=1" information="ma_nh$hrdmnh.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" external="true" defaultValue="''" allowContain="true" allowNulls="false" inactivate="true">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="loai_luong" dataFormatString="1, 2, 3, 9" clientDefault="1" align="right" categoryIndex="1" external="true" defaultValue="1" allowContain="true">
      <header v="Loại lương" e="Salary Category"></header>
      <footer v="1 - Thời gian, 2 - Sản phẩm, 3 - Khoán, 9 - Khác" e="1 - By Time, 2 - Product, 3 - Piece Rate, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_tinh" dataFormatString="1, 0" clientDefault="1" align="right" categoryIndex="1" external="true" defaultValue="1" allowContain="true">
      <header v="Kiểu tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo ngày làm việc, 0 - Không" e="1 - By Working Day, 2 - Not by Working Day"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_ngach" categoryIndex="1" external="true" defaultValue="''" allowContain="true">
      <header v="Ngạch lương" e="Pay Grade"></header>
      <items style="AutoComplete" controller="hrPayGradeList" reference="ten_ngach%l" key="status = '1'" check="1=1" information="ma_ngach$hrdmnl.ten_ngach%l"></items>
    </field>
    <field name="ten_ngach%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" categoryIndex="1" external="true" defaultValue="''" allowContain="true">
      <header v="Bậc lương" e="Rank of Salary"></header>
      <items style="AutoComplete" controller="hrPayrollLevel" reference="ten_bac%l" key="status = '1'" check="1=1" information="ma_bac$hrdmbl.ten_bac%l"></items>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="he_so_luong" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1" external="true" defaultValue="0" allowContain="true">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="he_so_dc" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1" external="true" defaultValue="0" hidden="true" readOnly="true" allowContain="true">
      <header v="Hệ số điều chỉnh" e="Adj. Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_khoan" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Tiền khoán" e="Piece Rate Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Phụ cấp" e="Allowance"></header>
      <items style="Numeric"/>
    </field>
    <field name="tro_cap" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Trợ cấp" e="Benefit"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so1" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1" external="true" defaultValue="0" allowContain="true">
      <header v="Hệ số 1" e="Coefficient 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so2" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1" external="true" defaultValue="0" allowContain="true">
      <header v="Hệ số 2" e="Coefficient 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so3" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1" external="true" defaultValue="0" allowContain="true">
      <header v="Hệ số 3" e="Coefficient 3"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien1" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Tiền 1" e="Amount 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Tiền 2" e="Amount 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" external="true" defaultValue="0">
      <header v="Tiền 3" e="Amount 3"></header>
      <items style="Numeric"/>
    </field>

    <field name="hrttctluong" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrEmployeeSalaryInformationDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hrttctpc" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="4">
      <header v="" e=""></header>
      <label v="Phụ cấp" e="Allowance"></label >
      <items style="Grid" controller="hrEmployeeSalaryInformationAllowanceDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hrttctluongbh" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Bảo hiểm" e="Insurance"></label >
      <items style="Grid" controller="hrEmployeeSalaryInformationInsuranceDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hrttdkluong" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="6">
      <header v="" e=""></header>
      <label v="Lương dự kiến" e="Planned Salary"></label >
      <items style="Grid" controller="hrEmployeeSalaryInformationPlanned" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hrttctluongnet" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="18">
      <header v="" e=""></header>
      <label v="Khác" e="Other"></label >
      <items style="Grid" controller="hrEmployeeSalaryInformationNetGross" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="stt" external="true" defaultValue="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_gt" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ttnv%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="319" anchor="5" split="7">
      <item value="100, 30, 20, 50, 100, 100, 137, 8, 108, 50, 50, 0, 0, 0, 0, 0, 0"/>
      <item value="1100100-110-11111: [ma_nv].Label, [ma_nv], [ho_ten], [ngay_vao].Label, [ngay_vao], [cookie], [stt], [ten_gt], [ngay_sinh], [ten_ttnv%l]"/>
      <item value="1100000-110---111: [bo_phan].Label, [ten_bp%l], [ma_nt].Label, [ma_nt], [ten_nt%l], [stt_rec], [bo_phan]"/>
      <item value="1100000---------1: [vi_tri].Label, [ten_vtr%l], [vi_tri]"/>
      <item value="1100000-------11-: [tk_nh].Label, [tk_nh], [ho_nv], [ten_nv]"/>
      <item value="1100100----------: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>

      <item value="111000000000: [loai_luong].Label, [loai_luong], [loai_luong].Description"/>
      <item value="111000000000: [kieu_tinh].Label, [kieu_tinh], [kieu_tinh].Description"/>
      <item value="110010000000: [ma_ngach].Label, [ma_ngach], [ten_ngach%l]"/>
      <item value="110010000000: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="1100-11----1: [he_so_luong].Label, [he_so_luong], [tien_khoan].Label, [tien_khoan], [he_so_dc]"/>
      <item value="1100-11: [phu_cap].Label, [phu_cap], [tro_cap].Label, [tro_cap]"/>
      <item value="1000000000: [he_so_luong].Description"/>
      <item value="1100: [he_so1].Label, [he_so1]"/>
      <item value="1100: [he_so2].Label, [he_so2]"/>
      <item value="1100: [he_so3].Label, [he_so3]"/>
      <item value="1100: [tien1].Label, [tien1]"/>
      <item value="1100: [tien2].Label, [tien2]"/>
      <item value="1100: [tien3].Label, [tien3]"/>

      <item value="1: [hrttctluong]"/>
      <item value="1: [hrttctpc]"/>
      <item value="1: [hrttctluongbh]"/>
      <item value="1: [hrttdkluong]"/>
      <item value="1: [hrttctluongnet]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="100, 30, 20, 50, 137, 100, 100, 0, 8, 108, 50, 50, 0" anchor="8" split="8">
          <header v="Thông tin chính" e="Information"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="4" columns="769" anchor="1">
          <header v="Phụ cấp" e="Allowance"/>
        </category>
        <category index="5" columns="769" anchor="1">
          <header v="Bảo hiểm" e="Insurance"/>
        </category>
        <category index="6" columns="769" anchor="1">
          <header v="Lương dự kiến" e="Planned Salary"/>
        </category>

        &ListCategory;
        &PostCategory;
        <category index="18" columns="769" anchor="1">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &ListShowing;

    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIvWjx1EwnNejFluB7kH7yOunEezhXzgOimu5sCrrxrhmVqlEVYetUUJOxcefotS2oWzCNeEtsB681LTBB4gOjER/mTsNfcVrS1jRovNOx3yByAE3g2/ZOPFB72dOZ9X+3cg/Bch/4c9tr2b5BivM84EpLVK/4rgNVeXdh2GkwKBIGxNh/LMMUmtJAIrW2havQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFYdV26gZh3fuc8sMEXOcRAU/HkeV2xQqqYaYB8dPCc2E3sntf8T3yti+nmkYjY5CrBF8+wAZOaEU8t3BKVuPPo9BJFOZ5OrCXIqKHa3u8wK</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw40o819Z33fS5qhsJqikzJlrBlyBWdGWjLkLUMQqsCs3BVZ29IZjN0+Yy5fNRlvjyDTwo0tA99P/UiBKF2etJwj</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w+k8DEvTq+TjAzsNOu9dopn9jBE1uJoKcbc7Yxn6CLGU/wRG/FuQnYPcq538Y5Fnla+1T7pwji9IYR5dwAq+LtCFUnNEYupWme24gDXSMEezIYilpwLwWW4XUcKmfpo4ZO/z5MMxPyJD3dOzPTHFAPK3Otj18XYkRl9u8wfyo+slDuSz42XNmuCfMv2Av6WgUZtsZ1a8eGgOiRre8VK0j2ke8wzmttHTOXdDcRJjLik2LBa7p/CUBAJJPgS829JC82wUJn73M1PwwPCaZNDcVa7yTkcoPVAg3xDcROS5kkVH1tg88xxoyvNXTR/mxygLKg0MLVBK0we+xZB1xAKG4Ysm4N6eav011F5Ka+kEoUl6jTavmJED9vVRD1qN7u333C62Qp0qjMeSVUtuvDbNJYUa/S1T8kJEEqPsTIyP5tHgj1zM7LckytF+rR82iAaKE7r5wIBZg0f9QDywN2gMkPRS/UHUajMSfHQCNledqFw5sboPd++ca3k2tRQDWiHL4oJm6UokNKs9PT7eBDi/xBRnZm/1i3lAb7P7mppoe3HR9pvk7JsMVXXbW6QIbiD7WzKwfiedwL0EI9mhx7ObBs+JC4U6oYFcwRRWdWy6KBgth24Hdl+tNvCu/nCEaTjKxzZe3eyKPojRF/TijaD78Woo78zvb0oBUbMQkg2GD68aJTCz/Cnnwe7v5fBubJwAcRux0XYgUo8hKfLRu71ViRwS3LBYzeZnu4nXqfLBmD3AGzmxf8m6PPwn8TNEbWvepcDi/tO3DuWr7dbSNd6snk9RcQetWcgW/HD1+cFyPTS16CejoXS36Ze2E5ky1VZk8ck1u5P5HCGskbV+im+SlpGLCn3QxY7ym5OhhocitrVsYMv/0umL34JYyUwvLBVa/hGinq3Z4v89zx11OF/LkWV9RLwQe7/2uC76akUgCnYxX1jwrwwC/yjO78DqNXzD9nhKYvR7EUumGavuPLIxB6MCbdpTpVJYUuBvahkZORxFGclpHob18kmohYOfSVIhp/DTN/r2rJOG9MiDJcVEjPKVF8/x2lGP23ySkmuyp45UXRYjV7h/JmdLMAFev7+xbY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxCw/C8Xl4k8Xg4lecp5v1ONq6l365RD2Yr1mdGUopOuI4UwHSqftX4meeengfOxnew4EFfM+HlwKIt68kni0iEUDqd+hFgcB3uEey5KVAs3xZ/Fp3246H74A2y9ZUQEgN4wJZBIeLme6P8mPWGv5FzvOMmgmFj4fcIgHeco/XTfNWXMsK3acWjn+AGrPZ4tAw56/hDDysH2vtbKNQQ5zOrZOQaU8mgQpTNlK1wQggp2BDTfaf27MW0jVEpz/8IoYAHJzqRxm/F+mkZhKor2uyNcJ8LYYkKfuYtsv7t6j8dQ5TJW+VdRGtIS6WWV+ws5lsQ3R9oWtvU4irOshzPsn7P+PVxXfWbjO5f4omdKrA2weEa9Xj9nj5zgWL2Q064kgr/uby/bj7GPKQ95u0+Z+OqAhoFdm2FRFW81QT5XzXrrR9/fggw/+vb8GQ3L7Zx4R/V/xY/rvFfjU5Aq+syV2C9jHymJoaOqU8OUx4bJ7BAHueEl3s3pCr9hnZf7xUjw/40JkxNhfc/qeGU9Em0JCQKUaOS5rMk/g43fB7voX8rimzIYthMGbjUAjCwhKk4RqzVjXZjBqwxP2wJ5Qj8mcsuzOzDk46PRA4ahHifqEpsfhKFspY7zQEYIR3ubx8Ac9Sl5IacAlOHWDDWpByMzvrHvmgXhC15qmQDBVuFlA94wslOtvNnx7a8xNEonapIQzZMlhUXalOOaJiPx5jLtZ1V+5T1iMBtAJzydNsBd8/GR5qq82lxBcpk+jdczzM6dLAJnKN3eae66i7j8TCmi7Ei9Hpc+KfweC6PDX26wOyiNAgExi6ge2GoizEih7TVkYXIr5PMFL3IsYMxZt/eijjXvncST+MMeVOOGiUxw8ukT</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RqAuJC95KuO7IeYpxBWu3rIgaUG8/LJL6Houy/xYRbh2bcw1ViA9gUtjP60gBFyGskHBBHNgGvwT6bSrDO7u5s=</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VJvj7NkwuBcVNTyepJpRGzlMSap6zaQVfgTsGIeMqFTuwXPs7pWhL7oPuiq2LWl/mzMkaDFJk1oS+Dn8eAtqlTyC3/WUXSjenLwBklKCIpJyQz2Jz4xVNvZkOXF14i8XX6BIirFtzcYHWWMrm+bQSGuhTJXinzdS+Qytsb9BXl9ZqKAi8t08uAcx2iKcs38cNrTtcgpSPck7njLoyV9kQ83uuOrRnoG8ruwwSk7UjFAOeitbBh6NWp0HrW7XkWLwrdAN23DNtPBzQaRF61jjkKzMgG/xGaZeSFZlP3CDW9kHEUyvEHa1nCE+rY4HCX/PiO5HhbaQae5LGRnJpq8LUPkupH7GD1IeMeIhGEVQtqlgkvdGXwjtz1PcBnWMJ3jLzJYQSGGpJdAbAynyhPVeWXjinzcv5mwWdqOUeI8B/vAmeGWjQ/D/6Wn7WD8vA/aK7Ilxdwvh+WZsHvy9bJd19gE9LxmpSSL4J/vW0J8Mx7X+B2whIv/kJONtkCFny2rzsWOPQuGkUXPBu0JleR7VxfCQvupS0qQ0XfXgdIG2o7j+vZ1YTizy56jMKknivcJZMoAnaz2ayPLKLPIPFgDwxFprp2y7hq2e2pzdG+S098tkgyfCiZdguuJZLtZ1kHXqouzu7D6RiY35k2F0LbdKVUjDZwx4DC6ExcXm7OVD86TrduAjBmxJTl2hSxKj/xSYTgHNQ/vp+IYYKsIpyg8+TOHDULYa0i82L6+2nSmcbpPypEH/iUCWqHFQhtqUWtnEG+zOlQb8BIYsq++MLtlbo+g/2R5J9dm2YK5Y0y1pTEC4ogRAlTAbllW+yvHbS5diKLpShwb+vsuuT8DIN6rSJNBr27lcVQGB+bcTLKjVXjdmgjsDOYejUpWKmAj8JJ9WhE0hRpckqUS63ZVj5SqKF4m7YTwA5Sn6190a+ypLEaHsOGFlQlRf0Er2hPDdjveIXeu58K91wjMUjvlfNEwqV6XhBPm51UuDFH0Q6tG+d1e7Pw3V8Ccobrzqys97+EoDTuggsbcuUCbG2uejqtRdsI9RICi0zHvwfRJr6EGjcirlPApL0lVwQYuf0tzvItaYwcZwCcLlB5xyTWM0zE1thp8Gan5U6bOgNFLLRPrL0DLXq1UM0sbneRtkPlOTd4JJle9xgIPHcSO+j66iOw4m6bYY5q2sditGMcEhpDMMJkS+bw0+O58mISoDmlV+kZKJ5yzzdZH+vi/AKZNfTQAWzU=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bqI0/PrJCU/a+ee3Ue8mIgXyra4ZSszpm6cqSQYagpVFk4v3pqmGexC1/fKv5f+vQkNDSkTtK+WYuDpxqBhKZgs3z0lQJcC2zvfnzOL5fyAJoTe5kLXOoODWQFIeLElfkCk/7nq0wknX7IcySRtoHZ0e+j2P67hr8c9UEbUm4OP5/OQu3/JvSk4ponpO0MdANnDkozxRPbHSnhd9XYyFA19iSw8ZB2dVyLgknd7vKevv99OiLDWKmpasQ1KPzUjZI3TJHOeghgcy9JiTJ7HaM7gU1VhKm6hYnN/EDGxiT+Jk+yBLIz/UBfLhk2YsBnh2/nV30FS/qvv8DPGluKHF+I5CQk7zZ3nUT+BKTclfCx4yP6Vq2Sd3CLzrcL53Me3Yzo1hz7Dy0G0CQ0Tc6/YhBe4YUv6UYGe/tR72Z4nqpcwrvkT8H+O5R1b/rWiRtCCPQ==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrFz4CjXa8I2kHenDIYJX0GU41pXuyL10C7DIEXiABEziqkb87nPaMuTB+BnXFo6s6JjEeV/MZxGJ5j9WxGRpaFyRCrld5aaEkDC3fKOnO9fBPrIBw1Xjhw0zAF6xziY+Hp2pmyR77QvLEAxuJvDwwy8jhEnkOEIfFTx2tJZYKbWZRBagJ8XnWSSlm9lJFJg8dRqQsT3uYeM+INQzRuWs7R</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPk83/zJcLjcgZjrHW27FYo6tL4h/5htHptlXLGf88wHQnhMVDnoUnQOKcEbRlM5HEiQxxaL1wuDr6VGBDRWgqKAgKLhBLtZ13s/eCXNZlR3GNRB11hatgCMjJ/RkGKcrIbXFAMYavFaJ9Admw2eeGV</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/788aLldbiPtqgv/FTT/M2hN+bbdu7mG65W/NExgkTeyqH</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dtiPpBW2Z7PVz/x914B3x3kP9BEuw2nwiFKPGYa+1pqLg+SbzJmmh55F3IoPJNCOefAdPGaauYJuWdIzJyH02MRFQ7EhvBFwIjta+pfIvK2XGlSs4HNwo3QFDh2zkgQhi5PsxvdixPCKRvto79dz78NY0jhY2ogdfp5E5l2VxetwD7H+0EbCRN6N73Ho/orEhrpwyFAdxjfsx1qtpgTzDnliAfELfiLgBmRSxB1g7mTHj0jx0NnArybncmtaqch8egJqNR1ms6rStqyrFmSHxVrvAqdsdo8ed4Mb6DSO3pgqF2SLiulQIKdldRxU+0x016tpgdpsUinFLj4TMXhYM1ee68uA+JhRL72Ep20nSFXsj4ZDMrehg/qG7XrTwrb9UL2KjNhmm8JNIqBJJKAQvw=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K1RVCY4SdjgcsgWvnNvRWMjDE7hA/8ie5FicSB1OPX2b112W1p9/uoSLogg7Dmj4G6fy++nk1VdVD1CTB2v8n+5NmtsWhkcdoQqpJnbRiMOLDGp8HKMjkwbLKxsqv8QhpdhP2SHbi20dalTbSqdJs3g==</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmeoVvZFzYT6gDE4dw/A8Pv4zlmJL8QKGIsVE8CgCRskmvMVLSlOk6Al0hKYXnLYFU2EyjIXuodSm24MEyhgXmd2HSqo+MnxGxbleSb9A2ZLZ8X+OJPHNtjbxrzfoqP9jZLWg8H7zPGO5ykt9HuFAAxLKaeWrkcVYbJEd6goFGf5ioarNXtN2zSF5gm2Qwqbcuetc/pLlJDXxAPOrV1Oy0b0fJuhlRAw2vVCBlnysU8k/lTYP0dXySXkBJ+VscLd78maLYU3O5/zKoWXfu+dSBVr6+OJCHRd9kutuptkaan13xk+Pfa9MLqyvyI/0n80WpqTounWz30eA97mounc9SJrYLOYT/CINL8jPHI+x6504hZhDgnER4ZurWaJWdnYYQXEjcUAXW2sz+P7fu3IwUeOyaXEo//lNDC2uYwwkVZyrFrb/rn6O3e4D3KERllF05HfZfaCBeK7ELd9n69qypXGrU6FSZ9sMxaHf9OhTCadMjPw1w7HudAgZqGdv6g3/H/aYjhU0VXJnJlexFLNGTL3FxbpLg9PkHU8ZIaiPTYl0JthqHiNrtcKkl7yhwJc3qJLLI93UKkkEWU2LiY/2Ma/oX3Ciq+UYFU26tWLT0XsaYXTMK9NL3O0wpUFuw14pGc3UYl7VDnaWfkOmuT+WjqSyAkjXpBNLkpX6fxk5aBou7LzcQQ/ivRljC8PNydXLDc1YnanGYTeF+n5Vxccr/I2Zw/rBasuJKtx07zSEf4jo=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>

</dir>