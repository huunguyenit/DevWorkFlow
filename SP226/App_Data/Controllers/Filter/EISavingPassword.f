<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="" code="" order="" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận mật khẩu" e="Confirm Password"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>

    <field name="chkpass" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 200, 230, 0"/>
      <item value="11-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7F9Hrm8bLDOs6RT/1ntdsew4neVfZfRCMHWq8AceXJVinNdx/bszVuwDJfZxxSCZPo</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RVmNi0O5lsMUjE49SF5coQ/AKBZ/KJR6pKeLnVMvA3Mri27Xm2W8TWYuyAnS10ShMuQyJD+YXeCrBSh8uELnD84HwgvmtDFwEslFD3MPPgxpgXQVnGtEad2RNmBziwQXwPCO/KkPoPn94YpvsuftgnhHIHjR9cauqUhn7/u3Xq6pK9/2KwP6WNNPcgYhOC2u+G1lXCYzykgLdXwEcV3Iy+bPVegl0cSJRE9ivEaX4a7DO4QMub718C0K5FHUaDTak5wEGQ16ME78TJf+cizDak=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dXWbZTKDy+Sko210bcGJP4a/mEFUDlN56pJkixuOCUyrFPvRvXgSUA8i1DhsSg2+9ZVW6k7iEDAm9VMmb8h5MGloZ8pSKTb8nDKVpp6yb5Vw88JsMFZqID/6sSnaYwfEeGYeDw1sJXly2egSl60tCXSAsecwwk7+bWdCKFGvpTEF9ImTuN9AiBXoK5T0HP+vu+8BFMaWZmYjhrDI0BagphHDfTaRkaBeWG/lzFmQSOjMb10kygh65qCkDLnlP7A5xLKoxmiaYXHayP0KtWTZIyJmsldXQoH9rqGrxe8+6P5</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx3O/swNjHgshYp7feus3Fnv/Aa1XnjmheS3jVfm/T/CVyesdQ/ILhpUBnBJTVx9/wQ5bQNvW2zkusDmSviT6CuNNGvC7y54ys3SrDYZKyMNaIE9w/UhQpFKLEdIch3FilNztcCQa1lxmby+UHG9EfVs=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FljkP8NUm+FSctPijGXjRK24dvCNaZDgoXTdfx06ih8hNhNWH+30rNLg4bOwKblVuhdQrIwqJf+jnsFDaXmebDUfAOGhdJseH2OcmvYoLC48G9SKt+S71ZjhqZfoilStQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjlGJ7yg4qB0m37utAddDt/SoJD84nbFWgx4laCNNE+p2PCJU5Y6hRyqUXo6DjZaAcoXwvwte7q96S6NqiMt1ioI+iLwdwuWL2mtV6YKW8ui2Tq4HCHExwE7vJ8pFEJmUFY6JhAAWrQpoNJS1yJ430LTDaIIm7g85+/9YfpSuFs7EezkLe5qfQ1ALTE/17VwbAfmc1oPLVmUP0gNVpblYPvax8Zi1Cnnol+hRPVmSvnnPWK0xPu2A8jVJvwI1IfAoiWqt5lDzpePoAhDmfeJD2xGFM/4ELBNXKTDcJoxcElMVwsE0VFTZOf87pITF7B9Bo17VN8nV8LzGvFbOsEzaWDVcMHXOHlWBAKw1YpKgeClxqGNajyTXO3xm+j/BkE6VvVsEaIvGvgjDb9+Hn4EgzXLhq+tznWd67J7vJz20iLpcm5tUBCoHxDahULyYTPcHPakHZ3ulM/nYHUZvZy/PDUaZ60HRGramMdBz7FB1oyitFlYEOHA7cS1QdDgA3MFeT7A9wVNfya5I7tNHQ0HgW49inG0djMrBT5s7QRYqkXxfNPTgl5+7GrCHF0JElPrjxBjcf/OGDE6VBTBgh81OwUGgBJiLQGVaqSPNFZGG9jlrYIfpC1Ei6LtPovHN0XARJmLB51K01eS54h016vvT0juIb7wEChf1Z0rg6TVjSMP4lJsVTs0JKj+GsM/1saI6NAZJ4JbsDJPinsH2KTjdbxIwfKnegEKEB32KICe5poHthSR92YPvnbs64C5KQC2rkuKGqTU3DaDIl+9NyjR+4woSx7ITCVWiU1kdSp4W8CN5Rb3O5nZRzE4zcD6fyVZna6uKCcDPdFYV44pCmkz6jqk</encrypted>]]>
    </text>
  </script>
</dir>