<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Check "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights a where a.user_id = @@userID and a.r_edit = 1 and exists(select 1 from @@table b where b.ma_dvcs = a.ma_dvcs and b.ma_bt = @ma_bt)) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">
]>

<dir table="dmpbky" code="ma_bt" order="ma_dvcs, ma_bt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo các bút toán phân bổ định kỳ" e="Definition of Periodic Allocation Entries"></title>

  <fields>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bt" dataFormatString="@upperCaseFormat" isPrimaryKey="true" allowNulls="false">
      <header v="Mã bút toán" e="Entry code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_pb" dataFormatString="1, 2, 3" clientDefault="1" align="right" allowNulls="false" categoryIndex="1">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Doanh thu, 2 - Chi phí, 3 - Khác" e="1 - Revenue, 2 - Charges, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="###0" categoryIndex="1">
      <header v="Số kỳ phân bổ" e="Allocation Period(s)"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" categoryIndex="1">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày kết thúc" e="End date"></header>
    </field>
    <field name="tk_no" allowNulls="false" categoryIndex="1">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_co" allowNulls="false" categoryIndex="1">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị" e="Value"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị nt" e="FC Value"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị đã phân bổ" e="Allocated Amount"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị đã phân bổ nt" e="FC Allocated Amount"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99M8NswHnTDtxW2YytrgFluozgj59fnL5TR+IYrcYkkrHE/vWpOApU+G9ikBOx9spL6W4bDQeCGl08ArlcMOam1k=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_cl" disabled="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị còn lại" e="Current Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_cl_nt" disabled="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị còn lại nt" e="FC Current Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị phân bổ kỳ" e="Allocation Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị phân bổ kỳ nt" e="FC Allocation Value"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh" categoryIndex="2">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="2">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="2">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="2">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status='1'" check="1=1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_ku" categoryIndex="2">
      <header v="Mã khế ước" e="Loan Contract"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status='1'" check="1=1" information="ma_ku$dmku.ten_ku%l" new="Default"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi" categoryIndex="2">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" categoryIndex="2">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" check="1=1" key="1=1" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" categoryIndex="2">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="120, 30, 70, 120, 100, 100, 10"/>

      <item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110: [ma_bt].Label, [ma_bt]"/>
      <item value="1100000: [ten_bt].Label, [ten_bt]"/>

      <item value="111000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="110: [so_ky_pb].Label, [so_ky_pb]"/>
      <item value="110-11: [ngay_bd].Label, [ngay_bd], [ngay_kt].Label, [ngay_kt]"/>
      <item value="110100: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
      <item value="110100: [tk_co].Label, [tk_co], [ten_tk_co%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      <item value="110-11: [tien_pb_nt].Label, [tien_pb_nt], [tien_pb].Label, [tien_pb]"/>
      <item value="110-11: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl].Label, [tien_cl]"/>
      <item value="110-11: [tien_pb_ky_nt].Label, [tien_pb_ky_nt], [tien_pb_ky].Label, [tien_pb_ky]"/>

      <item value="1101000: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1101000: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="1101000: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="1101000: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="1101000: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1101000: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>

      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 110, 120, 100">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 120, 100, 100, 10">
          <header v="Thông tin chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 120, 100, 100, 10">
          <header v="Khác" e="Other"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7ayUGtSNUrfujJ4fPzjp1YXb9lVRWG/JZwzKJgjlINeVooePRAtSxzhpls+JfqCT3x7DNoaWf43CJXEGT1g6kV7FO3Q1E7kxnyZaxvdy69mZAiaZX2GufTfctFxqoDQ85AtzB6h6Qh8mcNZnaaMOt7BaAelqgQQzXUyGkC/MFLKNmObmyJC7bnYDqoi75trZnDjIPrupDXcRFAW+OKdW18aDQQgADYpwKKxbg7cmei1V46qcEzoYf96Bz4zTa8o8+zvETk1tMCIP4CyqSEviz2yS7t/zBKCGfqDY/WkcbZQsq7vPySPPEjdLaLG9HHdiqyZUILiq1rao0L5HoY8/AYFjDw9iYb73EKneJ2SEzm7S5x3tgKKXMXC4WYx/1dX7+R0vt7ukL2LcyzuD7F8B4ywR8+HdBAMW2tD1QOu1TfiJQRfAez8u4jpTBANtlw6m/iy0u7Ak+Hl3CVEXcBFFzmDugbwpYe+VlVwOuPeFPohx7HNasBCBWorGEMaQ9GKLH6tfaHphoxLVgnNkGHSwvmDmNvQkn3+tiVMOzr4fTth52OFsoC6MzyM7p1efApEHDxHxqIOB2kEqSKbPgKDZi6ED</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i3c4a6HBbQYgOiBZXZHiib2+EBF+UqSkwb89QPp81B1CVdRDyTpOLHv34lec6EFKtLriHibPkGvT7CeOLhi9h4Q==</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6idczFob42a14BuD8UPA8O9waMqekjfzebFqDQqGDX/2/oS/ueJ3VZtzuihzTcR8ae</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJfFmO8MZlakwrybeIEsowKeEMJd2BFmm6u6K4YE6IunrofWJg0aLo2iTKKtjCc/vc7eegZreZklaG7HwBORNLsmGGMVNQDPrR3DPnK2SfPI</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0NIUPiBM/JmUy6MxBhQSnEEqslMI9ubwmMyGCoK/LO/sivr0ZQuxx0pc3q1GB4g9tMPNWjmm+U6I9NbYiYmPfffg/KbTNC8XLOdKA+6G472nPIV81wJWqQokzapK0wBfI5GQTrbEqFa5E9ge5jJ9Gf7AhgFMz/LlzKZZZeaCtOW0lcu0RbiWeKeYtVSUAknwEu2IQYhIgWaWPR3XvMo8BLeiUxB3WIbCa4KKxnVfRH1u3XfE9d8Nedj8YRqkrUXxryKcT6jbKNzkoOuCUmiNI1qzCE9JBzeiQT7K1WdfWDoa9qLQQR2uvhfxsc9LMt0v21d0BF8slpAMLvCgSNrViBQX4ZEZnTxDfmZeUvWyJRSmoaFmxusV2eWqaimLOUUEKD5DL/EPv3hneb85Ke4G3mXPNzrij02UcfYmDPQim4RsU8UTL+xjhXi8LRimde2sWef5HSlj6zCx6j2PlO5rkMWZNoRBeCitYb7XUUtBrsilgHNwnGnOiTn2yuTC2kzGdM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU543JU0ktT1Fe2+27GuBtt7i99f/56VBzkW3q0RI0mpEsq5AplQPi6B/H5qN8fDBTd2nVliyOKyayYBeKXIAMxIZqR5Dle3Q88/Txx+qrTrLZMBhTHgeaUJT8N51FiGaaG7MsULbd9VNNQeHQN3eM8bN1vqVMgmVrnLDqAW7DvQOJoi9t2VPwb6rOvQPVo2AWTOcWygQPeOgeCbZ4GmWYzD96tRytcLvs8LANF6WwOEbO0SkJ0tg4nWe3iYTiNpEe</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZL0eaYqADMd3TDLRLa4QIbKNW1YaUS7nXyJ2ruuF4LPee2XcbnBWDUkJWt8pNyr7an6ozLy6IVWgeZz0fiuzUd/lAoMEsfKqp9v72w6tqHxWYlOAUk8ujfA3sTEGt99hWL4BQijtaVwPpjHmqTzRMxPQIn4iRLvPfeir1oHdNepRmdt7BNw9LdQpojnocaz+ZuD09BPan+1hFpj5UB8treZSzSdwoBt0VBMw0v8NexEP4dJgGfI/euy3F5CcU+iOWVxHRx0jzIvzpYov6fTG2JdwCn6a7uI9wJEhF+NdFs/Aa9o4+cnghX+NXzdkJZz+uD3MarjnDlyu9PY6WOwhBwxSSQyK/PUOf/uo7UMFP8PeucUZnO+lk6kLWhobtvRydUT6fjTd3X4wJvFGIabfK0U5Go+tLt2UAtZG5Zox/o2y0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyqsWZJUvWZJX8FiCG+AaIJGMMQMjEQ1nC7xyTyIlRl760X/z+xAIeQ0S4axJh9GvHEqiUNkQ3qr/w8T2i8UtM9d+HnKwmB7kyKu6qrCUslcV5mru2tTp86AQaCN5GPM7kb+xwBAh9DQUwWuCT07c/3CD/dj9TEMd3L/KcKAaHB2S3TCNZSOagnAWIomJhfIRV7qN5wNboS6llsqrBbkiPJs6/fJsnz+DrvfAThKyr3KkIBERam0kVMtVl7BrO/b/A==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQTrejyfMsWhyx/15RRPNM+dVgNSAuEazJRKp2/b4ozW5VNft/OoO5PRHT8L4c5uOFTU+obmLyceUt1+v9ZrHnKxJlxITc7W6SvdBAfkaA4YYlusqlwTSSGbs5Xze9Qtxu23G4B3yKLuot/aNL/C0m2UiI0HR7aGdp4Dj4IP4lUI19mqf5eIzrJbon9omHdb/DbaPyAJEloWZjzLC8qWi+4mwpTGdEc4YrbNByi2d5P667uylE5rtoJ/mQFOheurIN+TfHMy/A5IkgCD3UA/ZaWyjAoB3n8IgZWcNiB3WYQWStohBcFWcx/tOyzOoPgmZ9mfBa88uxYP+5GbwVS60=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4p5wiQo3uZndRnQihTQp/jkwgKfCMyw+zQzc31DBcMp7umXGb+lWEfpE3GEbRa4Kw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZCI0GULb/NAI6HB9bq7GpUPJazAibnkVDW6TOjo8K/V1sc1S6mWPjUF8cprZqiU8gkW8H8PS4fqh1oaiWf41f3h0XvpG5Xp+iSyvtXeV+kosyIOPieIc2WaP10kKesvpRMSS/WTixsLyYBfxhjF4bZK/dbMeFjjSjsZCeZkf/wBfYZMuT+5F/FbCbBpRoJCSowBDB1ntY6fSuGcv32fkseiQtmCRxY6FGmMoCPD4GegY4aW7m+nLCgLgU2aUhpMLd/4bGhQNaxTtq2QLIrC5sSFMZXuu8U6YaiLcjlkuZbH0ZcD8QVCPwLwTFFW8ygMMleNeVCuJGgs1lDvOuClGgNdKtEDGIot21CS++yuQfJvYcHehRG1kVqiZwg71AlQ8qcpWLAtKnB3wW06trhlfMRmp9z8teZcbDM0QcS5q+mN3e8QIOSpEm4d2qAUuroL//IsluUp3D+As/jipTubkgCVVKvPnuSErN03OryBqySqtUSLsM+hw7f4MHUcKyoNtGqc1kk92DzyQhoqNprd91+udE6gEeAV8QZ+6b96V5eUj7CNkBQM63tfmsQO46awE1QYaClsM2DNGM8S3fx4SyHCayBeiqIH/8UeZnbdvwl9BnPZzo/wpPyJyujMyytBz8Ek7LAKIdwWfivnEfTmf+y7Q69EYQ8OmfvzmKBOfommooX3hHZvITPoePRT0rP6IaNwP/17C0UdwwuTPQ1TymQshnRtDzsWPGBu6ZrLCT1i9anM7KYg7htgQ8QuU5peVhSrXmI+9T57RN4jdRIITUYzg79JUTUTxhMOQ5bJyH+hRwgi/uqjE7n3LPEa+lf1kxjH13StkPj63mF3s21fKZVe3trJCjHa98NSV2516W5H4EQOj+Gx/u0BFBk+j98+OLeh4Y3JgfTrS3wAF38QUCD1gOD4UyGWQTHLyYrH2XGTX1Umjwfz6QzPTFwMcK/aoSvHy9+J94+Y/iwzpJ8DiqBXeKpF1/yMvMXGTtjCL77ym52RCU/w2XFkfiWCvMlnhs25y+/sppUcJz/ek12nExIXXkWS3vLhEIFd/FUNJ5h427sFaJ7RsR3DN14pDQGQqvo+j7Mya23oSks1NIkwZ7tzVbUCStwr27UJGHRH7hyNChk0PaJ9Ht6xZoRZJJzX+jRShBTHdQnc4T4s+SBYqP9S8SeMndeIlEWQWCOtZykVFOFbuXHocTiQ3C3IKEDERQOo/O/m03lbCxDRiPbnsQ1phVnD3W5ZVsT/tIefQRQkjKKJiJJ6OXb76cFBqcV9s8cpFIMlGlRsjiUkomhP4zI=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcqPFebpzegNzQJy7xlsqJ0jA+Vs+VuuHF/LG6HHjPskuCJC11g9umZmLgteTl+Z3y</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>