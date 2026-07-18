<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "LoanContract">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.LoanContract;
  %Control.Unit.Ignore;
  <!ENTITY c "LoanContractUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "220">
  <!ENTITY k "ma_ku">
  <!ENTITY i "8">
  <!ENTITY Tag "dmku">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmku" code="ma_ku" order="ma_ku" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khế ước" e="Loan Contract"></title>
  <fields>
    <field name="ma_ku" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khế ước" e="Contract Code"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99GGdZMlNj/S6br+xSKtvpgF5tcfHAR0iDrp3v9dl10KhKbZqDhnUqHa2x39ZS4FwSQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ku" allowNulls="false">
      <header v="Tên khế ước" e="Description"></header>
    </field>
    <field name="ten_ku2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_ku" type="Byte" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_ku" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày" e="Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ef1l9eseLcrzGY/7PHQoG+lyc3Wy9+h/IDO2fmCEVsAemCdDBTJDcB6keSPzGBHuA==</Encrypted>]]></clientScript>
    </field>
    <field name="so_ku" dataFormatString="@upperCaseFormat" align="right" allowNulls="false" categoryIndex="1">
      <header v="Số khế ước" e="Contract Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ku_sd_pslk" type="Byte" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency Code"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ls_td" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1">
      <header v="Lãi suất tối đa (%)" e="Max Interest Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền vay ngoại tệ" e="FC Loan Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền vay" e="Loan Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ku1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vay" e="Loan Date"></header>
    </field>
    <field name="ngay_ku2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày đáo hạn" e="Due Date"></header>
    </field>
    <field name="ck_tt" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Chu kỳ thanh toán" e="Payment Cycle"></header>
      <footer v="ngày" e="Day(s)"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sl_tt" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Số lần thanh toán" e="Number of Payments"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" categoryIndex="1">
      <header v="Ngân hàng" e="Bank"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận thực hiện" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="1">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ctdmku" external="true" clientDefault="0" defaultValue="0" rows="220" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi tiết lãi suất" e="Interest Rate"></label >
      <items style="Grid" controller="LoanContractInterestRate" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ku, ma_ku" e="String: ma_ku, ma_ku"></text>
        </item>
      </items>
    </field>

    <field name="ctdmku2" external="true" clientDefault="0" defaultValue="0" rows="220" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Chi tiết thanh toán" e="Payment"></label >
      <items style="Grid" controller="LoanContractPayment" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ku, ma_ku" e="String: ma_ku, ma_ku"></text>
        </item>
      </items>
    </field>

    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="tinh_trang" dataFormatString="0, 1, 2, 3, 4" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa, 1 - Đang thực hiện, 2 - Hoàn thành, 3 - Tạm dừng, 4 - Hủy" e="0 - No Action, 1 - Open, 2 - Completed, 3 - Suspended, 4 - Cancelled"></footer>
      <items style="Mask"/>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &UnitFields;
  </fields>

  <views>
    <view id="Dir" height="280" anchor="5">
      <item value="120, 30, 70, 100, 230, 0, 0, 0"/>
      <item value="110-1: [ma_ku].Label, [ma_ku], [cookie]"/>
      <item value="11000: [ten_ku].Label, [ten_ku]"/>
      <item value="11000: [ten_ku2].Label, [ten_ku2]"/>
      <item value="11100: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>

      <item value="110-11: [ngay_ku].Label, [ngay_ku], [so_ku].Label, [so_ku]"/>
      <item value="111000: [ku_sd_pslk].Label, [ku_sd_pslk], [ku_sd_pslk].Description"/>
      <item value="110111: [ma_nt].Label, [ma_nt], [ten_nt%l], [ls_td].Label, [ls_td]"/>
      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      <item value="110-11: [ngay_ku1].Label, [ngay_ku1], [ngay_ku2].Label, [ngay_ku2]"/>
      <item value="110111: [ck_tt].Label, [ck_tt], [ck_tt].Description, [sl_tt].Label, [sl_tt]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>

      <item value="1: [ctdmku]"/>

      <item value="1: [ctdmku2]"/>

      &UnitViews;

      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11100: [tinh_trang].Label, [tinh_trang], [tinh_trang].Description"/>
      <categories>
        <category index="1" columns="120, 30, 70, 110, 120, 100" anchor="4">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="566" anchor="1">
          <header v="Thông tin lãi suất" e="Interest Rate"/>
        </category>
        <category index="3" columns="566" anchor="1" >
          <header v="Thông tin thanh toán" e="Payment"/>
        </category>

        &UnitCategory;

        <category index="9" columns="120, 30, 70, 100, 230" anchor="5">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1dXeAj/yg4H2M40PbMiZ3ksg1X8dPDH7kzG+b6UGVkUWl43uNVH7So42f7mK4REPFs=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvOZUPG8uJKQZICblkQx09b80u3DmtgyfoiqjJwC1NU11U7IwU/236SgG7lhpJtwEIo=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW6xteGLza/CnFLauupmhr3p1LsHNfDMbhLfBsnPszKH41ovR7RJzMx1UOcuUGjDyI9wYhF0CIAIchy2Y/1gtdcC</Encrypted>]]>&LoanContract.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdsGa5OFiP4beg+4uPzrVCEcwd0rb55l38RcVtkN12t6zzo/IeHdbUkPuU8vOT2GLy3HzJwVzHdWjBVtqiVE8txUFmygh1QxPdUEG4RxH1MezIjIF6dN9K0yNSF0bC/OxEg==</Encrypted>]]>&LoanContract.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2Uto/qG6m8i3GQ9PeKWvEmp76suluZFZpJwEgcZEHILUoN3Dt9adZ6wktfc8du6AD11tJCbsWHeXqpkYfmaa/O6gGgGgFrbIspW5GNR6JN2ng5ryleqq3QXLHG9FezO1wwJJHeREY4ijwnnG3J42WFzSPIqvDhBPL6p7T2Z+rqCzaGlM/S80oTQE2ZpNPNI2+BISkpGfsReJn8i3pcrtfjnNgi+9eMAiSQNdr8FjBNvSEMfX6sukj0miT6SqBiaOQrnqXrmOY8XfcnHpxhXI+TdsK9wkYATmyRaPbOoSWKn4wZSrqG9vxL8JpQE6eZV1diroSC7oMxVJ+zxPx0pc7eoYl+nz3lHQzravR4s+pxvzuHTH9gBcL+SY7CquP/xp7w==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC9x+aCOYLiyGQ1FZL8GDcLWLDqyRCaKjf05PyrXGq45tVC1g33Ur3OBf2Y4w2xQiRTQU8+znbi2gJjREVXbAgspQtso+yzW+ZpZrAX1E7PcU5VFo5MY4GClnBdUnwGPnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&LoanContract.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUPXAnQ9cediUONFi3WHiNlKj5moFn0U3oLYB5OBYq2we03LN8yvf658BFTiR7qkrtyK/ivDjCTBoDMFnkgBZOXs6vDqbLFhDZvfM5xzvm+kew==</Encrypted>]]>&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwQN4VT2tVGHKOm0oNSweOnqrrxFYXt2ZlY8fdPwgklnryu4Wp7hELDOKGbHz9S/NoObasPj0al8E6AgMezvOWQaddBnelRHMkMQOZjTvdjllUcKZ9xhTsULTmpYy5jgOVaNDrSKobzQwJaEaCRp6OEA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNYZ42FaAnPDxYGILy7sSRH3jZ39Z4YGpf0EdsC1TDdar8L7c8y0rCd5UA/JSke/bf/ttcj6DBw6oPXh6e/iBtQ=</Encrypted>]]>
        &UnitPostInsert;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLGN9m7/gs7c/KkWBgzv+dYRsr06K0yAxnLmmuzkORh13xUI629MmfKBqAb/lbGZc4XkG8xgnXvYCCBA+7tkcq8CRgum6Ve7SeHfkvA8SBWttfJZzTtkoYY6LEUyAQYyrxAIh8jraNRqEE7lDYSXviA3Crm26vBSHHg/iIOH/KB9XGrpC7larFfR8NKzurs0ff</Encrypted>]]>&LoanContract.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVEmEjufyJoNGB1EBmX3S5Llo/06OFma+06tTZm8xDi7lsgqHD32NxxgSz9VwpN8XOtsjmOH2O93q5+WaFXVFEu3XLaShYYN5WUUD35aWFzfEKq/PuB+9SE+xLIAfeHtXgNIm/k34nHZTE/q7rN+yeE+P9Q/H3Ry+d+z1fSQaZiA9NOFKWcXFG/WNcsfg8SeFwaChaVgvywqpcC6ElLJ+PKQWcT94igfD/00U0hTr3xZ9HBCSdQHWJG8e8QCJmiTk0Dv6uvyE5hH9/mYJJa+epz1pMTjY5TIWOENVe2uOge7ejVzgdXcAHedG+VRzzIlAGRTRh3VXGfWBs7FeMohaM4OP161EL4oSjragCibR2BxFe3J0oJsP6Ga836v5IQqffJw4oN++FPyjuqG/f8KpT/A=</Encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK1c/Iw3apcxge8ccCl40cEhlt714E22Zokcu9CKgoYzGCn1QxkRSGftp4iAUFv/+71L0HcBCKSkHOd6Z8DAAlqSugzfmdpbWyBPJSJlrqC7pG3j4EHqL8C7D6kybWBPfU7CqPuUjQNPBvVnyBmTuSQOE6tOz9LHVetUoQMSyXtPu5INJqw0bzV4pEJySow8r5+c4IQMs0wZ5+mMo1KYqZw9pPnJ/6h5E4wvnvBlEcRoSUhZlBX7HWONDAYhbNP8cvGtKhO9o5nmB30IfmDggtc=</Encrypted>]]>
        &UnitPostUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLveb4AHebz5YYyh+gC8QDEB0C8gpRRJ6DJZTCoJ0ODXfYCD9RBDS5UOAxBx44VaksRXDZM0CrNDWyBu4Fq1vQGUs94AJ+4v6eed5ACP9sxIkXqCrfvKlXdgEhxq2kOg88Pl/z2qZttmb4koEskJ6y0l3</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTHZmTM9EUDZ8Fs6xqKcQv8xmy/TXQjBI+8KRsujNx2xfzzUnNPB7k+2hNtl7p/dN6h0ZKP5ioDwhHjQcco0T9ttdACpqjbqvODTtqaQOldfdY7FmD7lQ9Wy/YzpiehRFSi8DQpwXfD3R+UBhneYAbYRDbU8NTozHWj8+Ze2J05iP2xY5XkYF0I3K7T20f3T+TE6ASt+kDSqHsrkrmrwGqxaL9EaELfZUhN68VtCmM9dr+d56/7RcCUa0+mBtlnriKQ/5Knh3FZx2JrCYFSHj8DbNlzf+9i/xnG+JmLKbi9m8Ml56lGBShrSaFGH4w/oWrjLbgZxHQqaZmvUY7mBq4DlzCuWPfukA/WiNYB+4RcUG+QEo3h4kY2qAqwRCr7Ar5N+xbWS3ISTJysXKo6PPqSncjDKjqNTOJD737m23SSNukgRsdqv6x5xtr095jrK0V1/5J+GQ9fp9XUW8WZKPvy/FD63sGexFoRMr+yAwR757++9PVzVH+NZCQiY1z3+ZtIDy2U0SaisQKGRqhOX1oBSF/2gM98zM3S8EtsSOveSyJ3wff4Nbr01WotGIAi2iNy59BjraionUtWtpSbVohyTWPgzftcr/1j6aULPjcayQ974SobQv1q5DTpMWrb6rgNfRzr8cz/900O0WZs6LxG07HW4SK65Eljusk/7qI5M3NfWAN55noSmWfzQH2nWywa2mtqo0eCYOD6HcZGMk7q6wZ4WHKVL/ngOnPW+s4zbh/pDrMDxJv/kAzhDygYzFiWaWVVjZa9HrXNFA0A3x21mO6D4vLH1TN6AgLPAiENPsWyZpOoKPEKvjCmcrsicvXvrkFwvwB4VvQkMhO16vpDTCq/vrFjvCT/jIuJVwExyzPWkjyhjABSCscmaOnZD4Kw==</Encrypted>]]>
        &UnitCheck;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl3IY6JNNir3xKYwss7rL7nRn2i/lzutj0E0jz60+s/6+c4TiN9RRKkTaH6vRMxCWvJ33z37WIR6NWIe15Chh0EMEmQSnx5pZzYNeE8/Ru4f7ArSPT9UcT7O8lzytiFXygU=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFydQyDJEWQcT9b3p7KM5oA/A3nV5KYBwq2DDJUPhG8RPSetxHiHKE3f/2NJBDyOYzMvXtaePS6IEerB/Y1N/ywbWUEMDUCL7XMcAM2vM849RRjaqsU8gJCHDaoNUHYRfkn/EHfcqdgS2eq4VQitr+Au78U+XFxN8UXNslccyqnZSG</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDRbDZFAzIA3X1qjoEbHr31fGZSHCQ637vQGPSShFUXkuc+bpruD2VEONvSpr4PM6b+NkSFyflb/Vj3t2LsFYrycfiIlHl/yXsOUBV8GgbsIcImYh2ef23bQOSKXlieDD3pXgg3CUfL2Hy4A7XBocAhaWzwXd+ZwfqZ534aKdyswk3oCiuLwqjUt5KAkQO0z7+xOCJTmYazpLCGCcNR5zO4JEDoZp4yxQFaPUGYebu5dQspA4SUsjJW5lY/n1IOvpBLsjtIcA8TVGvdHO11XJoI4QI0We3P+7yGA4/40NDDSfUt4Uj6n+fn+tkwYkDWq8UEjWl8iD9TzBFzMqFKCAaD7</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjEl3sRejzPKt+1XqSsvkpxLf/a2Y7g6v+4+/vegk2hA+AqVlsQGAeraZmRhA7p6H8HPh73ChLzZLzIQlSYT3e0s79jcUFUI6gyH+ZdqrToHr</Encrypted>]]>&UnitTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/788clSqd0qg4GwD3sZouGW/UIInaZLlltRWbNLqh2KIKZ</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>