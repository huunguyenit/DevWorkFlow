<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
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
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY DetailVariable "@d04">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC4CruqjvAq99R6iD8ej0xCvOi6RMbY4Vlr9EffZILD1xm6cDM3UAdf3NC1MOvRgvmdp8Z8CYatUTDNGA0bQ2nbpWYIWUjLzgX8ecFVgZeQQja1f0SeJBsUNECMDb+ybG6UMNIbPT8Y83fgUHtiLpN4rEQAXQwXjPB32IWzaFSTW7B+cvlRSi91UDimCfqg8vcckF0ZL42g76OPQ6peWAcvg==FastBusiness.Encryption.End">
  <!ENTITY CommandFocusWhenValid "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7vGlsZpD8M1W20wzoahzGNKzBYZCydxvujZVv05sZtlKPjYs6XYBXdVQN1TrWUEOCTqaVJjNPdejkMUJH6DLvRKXkiZOu5VZBffXLMgQK30IWrHTvo1db2cA/69ed8xSLYrtfXnwgGgnCtuHPR0jiHE7/gBQ/2L6+PwnBA0+9SZb+IJAOcsv22zr9psT3beowdRYa4laJjzt93uPqfzbIpVW02nNbZFmzNvzC1SEoaw0H38W2GfQE63RzrUIjR9KO5Uyma0r73G1Nldxpd8WBcGT3dX3qjBepj2BTOitbyT0vN/aZFDVJKUj9PIPr2qTg==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$buUp+dpqA2y+Y5vD1ekU0ukO+XzRCbtq1ozzOg9R3KgQt3wXD1aTZabGa1wlWlKrM+vEKQPhgRw/yww9dbclAzay9JTzFexuruZyKFahvFQ=FastBusiness.Encryption.End">
  


  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrDepartmentProductQuantityInput;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m04$000000" code="a.stt_rec" order="ngay_ct, so_ct" id="L04" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số lượng sản phẩm theo bộ phận" e="Voucher"></title>
  <partition table="c04$000000" prime="m04$" inquiry="i04$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_bp$hrbp.ten_bp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Eknp/YF5HQtSaJtHVmWlfDJQFowS714MKMeuedl/22Y/GjwAmy026tAEkA69ODm1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu" e="Number"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d04" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrDepartmentProductQuantityInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;

  </fields>

  <views>
    <view id="Dir" height="343" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 100, 8, 100, 0"/>
      <item value="1110000001: [ma_bp].Label, [ma_bp], [ten_bp%l], [bp_ref]"/>
      <item value="11------11: [ngay_ct].Label, [ngay_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----111: [so_ct].Label, [so_ct], [status], [ma_dvcs], [cookie]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d04]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;
      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafU3QcWHD7DGTy9QbS15GoatBAFmj7z3DyGe9EATpN5yfIhxWGGdWtvEG53DwwB/EOKt3aaZww1qNKeeLBPibERw=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+By9xOKtdypZOdDjISokXoXIH8JkwmlqAGPPVWsCqY+56yYLrvPyx6k1wQ1MSqXWk2vmc7Q5MOZ+5QgJpqisd99LsFMYoD7qVDtJ8wkcbdM4SOcHim9UQVF2jhNtux1V2VJSVSLR0FaWG27YkfwWsuZaNbN3Tciccl8I+YYIyBMWGRyXA10ZfXviUadBQF3tuAnpWKiDYl629P8pkMzvYIQUjRrreat6LlOF9P1IcT8ye7UmD59qF4d5Y1inGCPGR5fNTu0UAn4h8s3gnz+yJR55BiSlZS7nZtulfvmO4d2CoWQxsM3en0Tcc9mvRRKQjEY/3dyhoX0seY6ngayQQH2B39YfW9uXaoIVkWYZP9HpEks2oMa+bvrv8OpSbBNr7U72DcDvWCH6lOOnvnKNGp3/6QbwtnkQA6ZpLCwjxBpgEk5TV/sYNw2u/lxf55alK/jDnrfh1bboJ6v4uE7FJxOl/z9xo1m4Nk+7wmGZ2bpmIFEmW7wsGILPKOaG+JHe19CALz4NdGE1Y8hrFlutLDHJernSVFSGfMlBdT3gZi3RHWhIKuJrgXdsiSWPp9nlDMKE8yB832sK7sXheA/z6cWNjcPSdtiNDvVYZ4aFF6X8Qw2eqm5HmqpzXqLGpsSktSdCwV+Ka6uIYPA3WARR13UnpurEIdRRfNbsk9GtDHuwk06Cfu4oWthen7+zGg4GiVNnjYyXvZr01ekMDpG3JipX5Vz1ADa9F/LoK4Sx0i0ZpNlFl1Z+Gxr57U2tE32Qw50SZm+xqdzya3lioTLbsMs=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57gKoc+NbcYOSxvWNude3w0p010IXb1mBPfgRqfvWnDAmLbyekCfImENOFVqwxGxEcOVRrUcBit7I9c0fOuzlD/DFOJZb2wImyDZzIrQxWZDyinS3OqpkLyQww2v5nsTJ39XD/cVtK6n3I60ibC5e8ibDkOoQ8b8gj0SJL8nsaQ90UULwlaApDV8zF5xgqbp44KNfTYqToLSjMz479zj4eF3/yWJymyD3rzj5m+qM/j/PTVjlTVQu9NYvJhCNMyOfVzCKoDcXivdYO9spu/9ZdufA4bdjvSnZcgGLIdmjtV/SYtIqjn3QQbJUpfk4tBCpC55TcDTWcRnUaWfAFbVywaxNfei5DMn851NE/jTR51Mj2RwnHC+WTpYDT/ocW3MCDjfL+oN6+vhnRZgCtXGh2dS+rllSjYYIaI+a5eaovPOE3yrktxpWuyqVGGvDcZz1XCoJ2lToaBI2Z5/mQ79MrpA83SLXVSrhMsR6FamxM+hCcxjxE+JO6Au2Z6alHgkifQ==</Encrypted>]]>&CommandFocusWhenValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fcddQOtekeNe5Y4A9oZzZe0VY4YnYfCX8Ele4BfwXPv1VRm04bsWizdbwczdmaGiFupKxRUlB+Ymzyom8roOBah2s40jQ+VfzWHGv+TN8hQ0jRNMmEHxoXJT/1dkh4KrbSQHbpUrjaBRSHEUkB3KedNGKpZDN/ImlvQspJzmrzNpos96UXLsprM2jgvH0nShA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNdCjgDGz48Fy7ooRWIBctemkN4o88ycGUeD0et7Ia/8XIYGYPr12NyziWvjGt7VYx7mHvRln5IOYaNRsWxgdJY=</Encrypted>]]>
        &AfterUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57gKoc+NbcYOSxvWNude3w0p010IXb1mBPfgRqfvWnDAmLbyekCfImENOFVqwxGxEcOVRrUcBit7I9c0fOuzlD/DFOJZb2wImyDZzIrQxWZDyinS3OqpkLyQww2v5nsTJ39XD/cVtK6n3I60ibC5e8ibDkOoQ8b8gj0SJL8nsaQ90UULwlaApDV8zF5xgqbp44KNfTYqToLSjMz479zj4eF3/yWJymyD3rzj5m+qM/j/PTVjlTVQu9NYvJhCNMyOfVzCKoDcXivdYO9spu/9ZdufA4bdjvSnZcgGLIdmjtV/SYtIqjn3QQbJUpfk4tBCpC55TcDTWcRnUaWfAFbVywaxNfei5DMn851NE/jTR51MjU47RCGceagIS91ib2FRuUYBqzoTXkJ4qoSpEMv9ycf2DNbdxkoqY6KbqdWq2V703i4CT9I4JMDu5alQf/o2Y5OHrLh6nZ/wU0LHCExB9XlwLwFcnqTQFQk5ZPsimcCFkma9V1QltN47kIfRJ8g6seXOKZc4klc4P4U4sz8ImLBC/olEn0iWbEZI/Ksouhj8GZUEhozy1xO3iu02HyI+7lQvJ9CaeU9mm12g8JbZFzsw=</Encrypted>]]>&CommandFocusWhenValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VgjSxGFSpPf+sune3Li9lHwtRFzFjyo7Sca8nhXg0y9AQCb8eCaTqOgL5iPkp8IEgC9seph0d8/WLhpxdgxAP/HNNb4KKMEanJRMdW0mSj5cSkEaladMeRXy3ymBeETpLVkuM2wYfZZTBL846HmbPwzFdG/8aocqfEmloaoCQ+wEu8Mz90khKMM/Xjk67ujBA==</Encrypted>]]>&CommandFocusWhenValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4S+HIA76Q9tIAoEHb7N4hCASw+yg+4zDIkTWwTmRqBaT</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsWfMUh3XieEIYWZcWwILaMyaAQ1j39p/8raGfai6OeVuWf8S4nW2M622ikFBIrFv+/f7aqgNpehoiDYfGlqRqgDYfYvpVnlNiemhlBaUDQrC3VxTmfSdg8HLbZU/E2uZEVp1XGmECgiCxnwgyXmA50aN5prpT5DoGQkLk254OQZcVUK6kpf2I7eyCLKSNCntWTQsyHkWR4spdSz3IpJOiNz6XuhIW9bays219LRU3sGStkgp6jH0xi3JL1POEgYVqIuqjipOlnKI5iYkNekoT3yxfLSgG9oSsdDCEtVTl6ZkKXBFJzvdUdQjxro/cVpkk=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Wp913Og9598Y2UX+4uPv8FgSwb8Dz0XloFCX+kSTgfIww4SsRty/AySueUiPMNuXITtSv5EJAq2S+pqQiDM27IZ3rMOjhTNTZ1KVDOa8l5D4g3vD1WQ+SJRhNFzLUDMHQPO3PrSm89Lzpzod7gCWPfyrilF3SAdHhgI59ucxc45wAAmuKTn7kUDBOwGOL/MA5B5znL6WqUidepocqiBoEKEQDQYCC9lObKIJX8/gil/</Encrypted>]]>
        &AfterUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0Ad1NinyNdpzNcaO+BS0ZsbCyLGWG2IbcELQqfHYJ3+x</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOm0ETcH+Rv2fDqY9yuf6kvigfzxIZShSvVQ3KGMG09wPefHBiVD6ivpHVJ9o43x2xYjC9pTAkrvprffxXQYX3lGL3ntAKvv+yJg4N/h9u2A3KIMHbcKvJZo1+FsQQZYt8kYhZdFpoVe6vdR2I0VytgFB2BUAIyZ9uo0vm3Hr1db4REiMmzZLRBuYM1se+Jq4qAio6AFeyuF6tyoEv7AuEALQSivxo7UZPpJuVstNXPxr8rBishvuGjkx8vMJCCOIBk=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez+4lQB0C/QUNavqPjh8RW3+KHgAkqekb+STdMULM2NPNDlHQ/+PeJBKhL791H0GBtutA6+P2x5XB6m2R59L8HA8WYiw12ZZzRt6qExGkAVyI=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFXWYBKWe2G3b9BVsWJm2NfO2m1gsVittoFgG3ZJPy85RbwQaafXgfSke9YTSLxqGU=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zwh3bGXTEXDW/lq385/T4/W6xDb1v/MXU2F3NolZSY6xEv9VOwDOujupovoqUhRFwiehevmstgHGbCobi5MsTUzridWaaotbZ91nPBNxRmkdDm8OkB8S4DDAvIOpmDBeeDKQQrC+G3k3kI0CpZLWLZiUQu03MMaE1W+jQBaS12DCBACqRibc/MrvKNlJncIXIuhDkbi+wn+nCfWPv9e22QjmsvihyDGnJHjCUuR2d3egYzhHtxKuZstYcIn/Nsn/L2Q5N6MBzDt0m6txA1LXL1BVhXKabeEmIL3zFynG1ee</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPObgLzHOCWHZN2tfoMPvbhXO/m6Hcs2oa6szZoFvEE2ASJCuBCPaNuO4zAAuJ4uoyBbq1419b2fpOF+PNRu9qhS0qvA4svIjMq6WMBbJEEULqzkirS9ttl9x1ovLjSi855rVH6PIgdf/cZ0paFs60JzY+ZNf8VhFouJa6u8oxV+B1dj28hLRmV8I/JhP5wplcsuEztDf7gnqTzY1svcngTaNF+RL4OsZx8VgmsAwraXhJxxFSj9eeb1xn1ru6+ABE5TrXAMnM8sCa/e1jDSohbKhViTxIIKNIItm/CCCkj26fg75OhYb9uqIrQUgzAnYrk5pcLGxKBK8zV/NwLvlSzXaBwkOeohONdPGdkCgwxH7ToPP9FpgBN0awED3iquOlYtqEYC3dC1/PP7tyDb539L5P1/xA8MJyFwF//oqHKiTSg==</Encrypted>]]>
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

    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+cHge8GidPcTUFYh+BLklXj/Zxvj0g2R28PNZronJwlbwBMIDUmAIbcm97sICIQDRHYIpobgdLnpsqbdqmotnciw==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>