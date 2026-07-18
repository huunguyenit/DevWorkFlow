<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY APVController "MRApproval">
  <!ENTITY APVApprovalType "01510">
  <!ENTITY APVDetailTable "d87">
  <!ENTITY APVHisTable "a87$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@dept_id) + char(253) + rtrim(@t_so_luong)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "4">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "5">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "9">
  <!ENTITY APVXMLFields SYSTEM "..\Include\XML\APVXMLFields.txt">
  <!ENTITY APVXMLViews SYSTEM "..\Include\XML\APVXMLViews.txt">
  <!ENTITY APVXMLCategoryIndex SYSTEM "..\Include\XML\APVXMLCategoryIndex.txt">
  <!ENTITY APVInitExternalFieldsDeclare SYSTEM "..\Include\Command\APVInitExternalFieldsDeclare.txt">
  <!ENTITY APVInitExternalFieldsSelect SYSTEM "..\Include\Command\APVInitExternalFieldsSelect.txt">
  <!ENTITY APVCheckApprove SYSTEM "..\Include\Command\APVCheckApprove.txt">
  <!ENTITY APVApprove SYSTEM "..\Include\Command\APVApprove.txt">
  <!ENTITY APVMailApproveInsert SYSTEM "..\Include\Command\APVMailApproveInsert.txt">
  <!ENTITY APVMailApproveUpdate SYSTEM "..\Include\Command\APVMailApproveUpdate.txt">
  <!ENTITY APVDelete SYSTEM "..\Include\Command\APVDelete.txt">
  <!ENTITY APVWhenVoucherCopying SYSTEM "..\Include\Javascript\APVWhenVoucherCopying.txt">
  <!ENTITY APVSetVoucherDefaultValue SYSTEM "..\Include\Javascript\APVSetVoucherDefaultValue.txt">
  <!ENTITY APVSetReadOnlyFields SYSTEM "..\Include\Javascript\APVSetReadOnlyFields.txt">
  <!ENTITY APVHandleStatus SYSTEM "..\Include\Javascript\APVHandleStatus.txt">
  <!ENTITY APVAddStatus SYSTEM "..\Include\Javascript\APVAddStatus.txt">
  <!ENTITY APVFunctionScript SYSTEM "..\Include\Javascript\APVFunctionScript.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY DetailVariable "@d87">
  <!ENTITY DetailStockType "2">
  <!ENTITY StockType "2">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCZAXyYe9ovlZ1VnK6Y2qA/LQo6T/4UGmDIQ8zyDGLGPgIdy0JYMdp2g2T0m3DYvM+R6hx4v+DCs2LG/x/jGDcrrECwn01+Dt7n/R2uzyxIRX0ytjY37G5yqSW4Ra5fA8CFastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "08">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyMRTran @stt_rec, 'm87$$partition$current', 'd87$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.MRTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX0" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu yêu cầu lĩnh vật tư" e="Material Requisition"></title>
  <partition table="c87$000000" prime="m87$" inquiry="i87$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dept_id" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người yêu cầu" e="Requisitioned by"/>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = 1" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7k5O5X+wgEC1J/rtYldscXTB4hHMYKzspHSFOBmRtnKF+RHaq5+6oXfSG0AcrOfsU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PKCszOjj/H8rduNfibr9hPe5lkTdmoz7uDZj+p10GIRtsBTUrV+Md5fFjlWILGiNg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="3">
          <text v="3. Đang thực hiện" e="3. Opening"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d87" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="242" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="MRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &APVXMLFields;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="302" anchor="3" split="4">
      <item value="100, 100, 337, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="111-10-11: [dept_id].Label, [dept_id], [ten_bp%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11--10-11: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="111-11001: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status], [ngay_ct]"/>
      <item value="1101----11: [dien_giai].Label, [dien_giai], [ma_dvcs], [loai_ct], [cookie]"/>

      <item value="1: [d87]" />

      &APVXMLViews;
      &ListView;
      &PostView;

      <item value="----10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 337, 8, 58, 42, 8, 100" anchor="4">
          <header v="" e=""/>
        </category>
        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=</Encrypted>]]>&APVInitExternalFieldsSelect;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1oaxuhxl/IJ4eZLZS2SKdD/87pUUzigA7dLQTTfU0nsUL8bPPP4YR4imEI84XDtC6J/vvdjAkAehazz/8qK8qQEQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC2U6I/SK4XryjlYTj08fTws9JA1k2zxkTaxyVDeDhm6J38q7eI5RVFZjrmcgoZSH3kTOTaAZvazPfUiB64z+KM=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &APVApprove;
        &APVMailApproveInsert;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34KQWa6rvN+mp9tF4IbTGhYe69Rky7OwTS03BRt4HfG5eXoOcJveNGXAyWf/g4XMoDNaIZwL90T1g6EBXkTqWUUJvPZDQPfU4S2LaNQAInIYdw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &APVCheckApprove;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku9LSAmc/8wQ0hjJKaJHgY3paUVHbu0jAe9h/cVBPW2QHtvpOROL67Xb0y7jetwenTd71Z3pWL21QIzKk8dHvTSnV5tJ00JVI7HNtR+uoLz/CHSdL5coHrQqeWcjc/8Pf7y5V07+j1EjcQCD3wkWaeUcC3UTSN96Q49N6hQXXcQG6V+PXZe+elmwMjjxZ47gAwkQSSo3B+Le1njST7N/LGXs=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22S0sRcM5bMiHsUVEXLmF8biPu9HrK+Tf0xf1GRLFg/VkqyhQDe6wA70Emk/NELGtOXpeJZZMEkj+X2Z0Qcdf2ETZvKVvdbwYw1OjVpyzilry5ZZbh4A1100xX6ElJaz5+L5SNyQ3qLW3cD/kS/qLcS4lIuvZGJXutshbgfRG7gQMH0+WK60IZ/ncO6mgYG0yA47Z2cdI/nWGU5J7nLBby829CTKU4Zj8H5zEos8DF9Kp</Encrypted>]]>
        &ListDeclare;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveUpdate;
        &EndUpdatedVoucherNumber;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTgR4GL5bpcicJgKWeLdNAS1M3dMa5lkYob/N/1+hEJluuF0JaZttiWlT0xDeXJQ26w=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3A8FuyKU39KDrvXtFhe8aO1b95jZXVeCv2+sxPmGIugkI8E4A6w8jQz9/QqVlD8BsIPsHEFQnqscGBkEe8tlcE=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &APVDelete;
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ETyUnfb/H+T0Ghlxq8HFhvZxQWmvilRrIuS1GOwhucCt</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpWhQoUpad73yGdQDMg5nLt1K4cGdln6SF1SuZSG7epIYDUdPU79X6LGvGjksOHyYhC4iqV5sA2eq7NmBCJjsgQZgUzYen5pni3+G1HeYuz9mjYRi5Z7LR9GSsyLAeJAaVN+HzPmkGEcTGZxDAyBtUE5jOVuKWBStYwjYpHyuxQxZWJCtHI5bYwY+yxSeHwux/b7zk4+e6JYqvvd+6t517a+sczkt5xZ0oLZ1ipTSiQG9XsHDXrmamCVTbvd9/b37XbWqjQfytJBNFNuC1uLiR5AmGVF/G+o7XvvQv9e774395Z8cAHSqEBj+dUvEdHnix</Encrypted>]]> &APVSetReadOnlyFields;
      &APVHandleStatus;
      &PostCreate;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiH23QvDIyMc0PoDQ3JaNjga3nLF32xYfPx5i6mBH4NhTQ==</Encrypted>]]>
      &APVSetReadOnlyFields;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4btXzG00c5aWmpYfnDs8E1LoKsESW3fWsGFRjx9Wdn79R1U4lbzFGnKYbrI43rVxHw==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9XMYD6iynu2Ki4WhoxiWsVsdSdx/cC0GWhuOEh6RxIl11Kv0ENgbaLpzpmB0gTDHcbqHWuASkXjIg6wcr5/gvVt2tvVG/QZGTJA8h4AAr+5NYMaICdxKdq2BE6FFFj/d++PVgLiQEV26ESGVmlQ5gNc=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezkh00fohHjsVroLIS67EIOyWdeFH5B4x3lXbVJxKmrgZ0SZboRDGCVy9fwBw3e2Rbga0BhVkx2HYS1Y6R1UkkrzJKOQgpOWx045Q4oy4ef60=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFwCUoju7saw8woa9ZCLE90y/4hRTYVasMmW+mVU7Ld1g==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKEMCzYoLWUlEvYv23Lr8QKiGn/xA8ls8HmfqUzTd/JQdApxTB62oSpVdjJP0WlwCeY=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPGiwISQDhmcrrV4WqfWYQY65H7+xd9mNVsc4Dzw7yjEarURSQ6GiBAeSFdW5dxFmJMh/LxLpLrf0za4QPxJwhvpSSz6579mnuUqqDFFYp6fmHZLVJvFpE4DgerrJt5kKyUrT6BR35RjMHJWRUB7+hHm5kjJe+DMnRwDCWdjK/+YWLeZP+ZT7RJMO6TwugC6LjXOe1vtRkN/MqfSmmQ0HGtKMEAWccvDI1BK8ZBNPUKtD+KKi+kzX4CVYDdlZ6GL/s=</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL7amRT1++XE86vRuQbdrJlawpOKnBCgxG0KSRuNztKYRxMZxJo26wRFyWtWxbinILB2B0wR/ZE6nCCiaNVYWzjY</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Wfk9+0d2+RqD6ceSGlfyRXzowjpLuUny9lvuPa77fuKypjARcH64Hmey4llON4O+AyxuKTDn03hjTDbnufW7wHlXpBqOd/LyNLMiAZLwsgT0OLpSNmGylWeqOBe/WTnYgJ+vHnVgD7PMaa48ArFuaQ+OJrQnbL9nMGAeJYhAx4qtx6ztEU19OoSsvSJITCHQbbXjXer1HTSHqpquuF7nJ0=</Encrypted>]]>
      &APVFunctionScript;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLoOpiCbdYv/LJHRk0UatSDVEBwhcTw44AVXXdh82eyG287NYQGHSSnSdE748EMGd3P4j5Dv+j3ZF8Ou+5mMZt1XZJICjaa0s0HtEsviq04t</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>